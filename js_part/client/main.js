var socket = io();

socket.on('addToChat', function(data)
{
    var message = jQuery('<div></div>');
    message.addClass('chat-message');
    message.html(data);
    jQuery('#chat-window').append(message);

    var win = jQuery('#chat-window');
    win.scrollTop(win.get(0).scrollHeight);
    jQuery('#chat-input').val('');
});


socket.on('draw', function(data)
{
    ctx.fillStyle = 'black';
    ctx.fillRect(90, 90, 420, 390);

    ctx.fillStyle = '#ddffdd';
    ctx.fillRect(90, 450, 420, 2);

    for (var i = 0; i < 7; i++)
    {
        for (var j = 0; j < 6; j++)
        {
            if (data.grid[i][j] == 'empty')
            {
                ctx.fillStyle = '#ddffdd';
            }
            else
            {
                ctx.fillStyle = data.grid[i][j];
            }
            ctx.beginPath();
            ctx.arc(90 + i * 60 + 30, 90 + j * 60 + 30, 25, 0, 2 * Math.PI);
            ctx.closePath();
            ctx.fill();
        }
    }    

    ctx.fillStyle = data.color;
    ctx.fillText(data.label, 220, 90 + 360 + 22); 
});


socket.on('exitUser', function(username)
{
    jQuery('#' + username).remove();
});


socket.on('get_username', function(data, cb) 
{
    $.ajax({
        //url: 'http://tuna.com.ru/game/myapi_username/',
        url: "http://127.0.0.1:8000/game/myapi_username/",
        xhrFields:
        {
            withCredentials: true
        },
    })
    .done(function(res) {        
        if (res['username'] == 'AnonymousUser')
        {
            console.log('anon');
            window.location.replace('/account/login');
            return;
        }
        username=res['username'];
        cb(res['username']);
    })
});


socket.on('newUser', function(username)
{
    var user = jQuery('<div></div>');
    user.attr('id', username);
    user.html('<b>' + username + '</b>');
    jQuery('#users-online').append(user);
});


socket.on('updateHeader', function(data)
{
    var buttons = {'red': jQuery('#left-button'),
                   'green': jQuery('#right-button')};

    for (var col in buttons)
    {
        buttons[col].attr('type', data[col].type);
        buttons[col].css('display', data[col].display);

        if (buttons[col].attr('type') == 'take')
        {        
            buttons[col].attr('src', '/connect4/client/Take_empty.png');
        }
        else
        {
            buttons[col].attr('src', '/connect4/client/Stand_empty.png');
        }
    }

    ctx.fillStyle = '#ffaa00';
    ctx.fillRect(29, 8, 150, 20);
    ctx.fillRect(449, 8, 150, 20);

    ctx.fillStyle = 'black';
    ctx.fillText(data['red'].label.slice(0, 10), 30, 27);
    ctx.fillText(data['green'].label.slice(0, 10), 450, 27);

    if (data['red'].display === 'none' && data['green'].display === 'none')
    {
        jQuery('#canv').css('margin-top', '50px');
    }
    else
    {
        jQuery('#canv').css('margin-top', '10px');
    }
});


socket.on('updateUsersList', function(users)
{
    jQuery('#users-online').html('');
    for (var i in users)
    {
        user = jQuery('<div></div>');
        user.html('<b>' + users[i] + '</b>');
        jQuery('#users-online').append(user);
    }
});


socket.on('winner', function(dict)
{
    $.ajax(
    {
        //url: "http://tuna.com.ru/game/myapi_winner/",
        url: "http://127.0.0.1:8000/game/myapi_winner/",
        type: "POST",
        dataType: "json",
        data: JSON.stringify(dict),
        contentType: "text/plain", // important!
        xhrFields:
        {
            withCredentials: true,
        },
        
    })
    .done(function(response)
    {
        console.log('winner success');
    });
});


jQuery('#canv').click(function(e)
{
    var x = e.pageX - canv.offsetLeft;
    var cx = Math.floor((x - 90) / 60);

    if (cx < 0 || cx >= 7) return;

    var data =
    {
        username: username,
        x: cx,
    };
    socket.emit('move', data);
});


jQuery('#canv').mousemove(function(e)
{
    if (jQuery('#left-button').css('display') != 'none' &&
        jQuery('#left-button').attr('type') == 'take' ||
        jQuery('#right-button').css('display') != 'none' &&
        jQuery('#right-button').attr('type') == 'take')
        return;

    
    
    ctx.lineWidth = 2;
    ctx.strokeStyle = 'black';
    for (var i = 0; i < 7; i++)
    {
        for (var j = 0; j < 6; j++)
        {
            ctx.beginPath();
            ctx.arc(90 + i * 60 + 30, 90 + j * 60 + 30, 28, 0, 2 * Math.PI);
            ctx.closePath();
            ctx.stroke();
        }
    }

    var x = e.pageX - canv.offsetLeft;
    var cx = Math.floor((x - 90) / 60);

    if (cx < 0 || cx >= 7)
    {
        jQuery(this).css('cursor', 'default');
        return;
    }

    jQuery(this).css('cursor', 'pointer');
    ctx.lineWidth = 1;
    ctx.strokeStyle = '#ffaa00';
    for (var j = 0; j < 6; j++)
    {
        ctx.beginPath();
        ctx.arc(90 + cx * 60 + 30, 90 + j * 60 + 30, 28, 0, 2 * Math.PI);
        ctx.closePath();
        ctx.stroke();        
    }
    
});

jQuery("#chat-input").keypress(function(e)
{
    return submitChatMessage(e.which);
});
jQuery("#chat-button").click(function()
{
    return submitChatMessage(13);
});
jQuery('#chat-button').hover(function()
{
    jQuery(this).attr('src', '/connect4/client/Send_hover.png');
}, function()
{
    jQuery(this).attr('src', '/connect4/client/Send_empty.png');
});

jQuery('.take-button').hover(function()
{
    var button = jQuery(this);
    if (button.attr('type') == 'take')
    {
        button.attr('src', '/connect4/client/Take_hover.png');
    }
    else
    {
        button.attr('src', '/connect4/client/Stand_hover.png');
    }
}, function()
{
    var button = jQuery(this);
    if (button.attr('type') == 'take')
    {
        button.attr('src', '/connect4/client/Take_empty.png');
    }
    else
    {
        button.attr('src', '/connect4/client/Stand_empty.png');
    }
});

jQuery('.take-button').click(function()
{
    var data =
    {
        'username': username,
    };
    if (jQuery(this).attr('id') == 'left-button')
    {
        data['color'] = 'red';
    }
    else
    {
        data['color'] = 'green';
    }
    
    socket.emit('pressed', data);
});
   
        


var username;
var canv = jQuery('#canv')[0];
var ctx = canv.getContext('2d');
var height = canv.height;
var width = canv.width;


//setTimeout(main, 2000);
main();


function main()
{
    console.log('ha');
    var backgroundPhoto = new Image();
    backgroundPhoto.src = '/connect4/client/beach.png';
    setTimeout(function()
    {
        ctx.drawImage(backgroundPhoto, 0, 0);
        
        ctx.fillStyle = '#ffaa00';
        ctx.fillRect(0, 0, width, 40);


        ctx.fillStyle = 'red';
        ctx.beginPath();
        ctx.arc(20, 20, 5, 0, 2 * Math.PI);
        ctx.closePath();
        ctx.fill();

        ctx.fillStyle = 'black';
        ctx.font = "20px Arial";
        ctx.fillText("     * * *", 30, 27);

        ctx.fillStyle = 'green';
        ctx.beginPath();
        ctx.arc(440, 20, 5, 0, 2 * Math.PI);
        ctx.closePath();
        ctx.fill();

        ctx.fillStyle = 'black';
        ctx.font = "20px Arial";
        ctx.fillText("     * * *", 450, 27);
    }, 200);
}


function submitChatMessage(code)
{
    if (code != 13) return;

    data =
    {
        'username': username,
        'text': d3.select('#chat-input').property('value'),
    };
    socket.emit('newChatMsg', data);
}
