var socket = io();

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

socket.on('newUser', function(username)
{
    var user = jQuery('<div></div>');
    user.attr('id', username);
    user.html('<b>' + username + '</b>');
    jQuery('#users-online').append(user);
});

socket.on('exitUser', function(username)
{
    jQuery('#' + username).remove();
});

          
var username;

jQuery("#chat-input").keypress(function(e)
{
    return submitChatMessage(e.which);
});
jQuery("#chat-button").click(function()
{
    return submitChatMessage(13);
});

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

socket.on('fuck', function()
{
    console.log('fuck is recieved');
});





socket.on('winner', function(data1)
{
    console.log(JSON.stringify(data1));
    data2 = JSON.stringify(data1);
    $.ajax(
    {
        //url: "http://tuna.com.ru/game/myapi_winner/",
        url: "http://127.0.0.1:8000/game/myapi_winner/",
        type: "POST",
        dataType: "json",
        data: data2,
        contentType: "text/plain",//"application/json",
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
         
