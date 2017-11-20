var canv = document.getElementById("canv");
var ctx = canv.getContext("2d");

canv.addEventListener("click", new_click);

function new_click()
{
    socket.emit('new_point');
}

var socket = io();

socket.on('update', function(data)
{
    console.log('fuck');
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, 100, 100);
    ctx.fillStyle = "black";
    ctx.font = "30px Arial";
    ctx.fillText(data.cnt, 30, 30);
});


var bombs = 0;
socket.on('draw', function(data)
{
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, canv.width, canv.height);
    ctx.fillStyle = "black";
    ctx.font = "30px Arial";
    for (var i in data['users'])
    {
        ctx.fillText(data['users'][i].username, 30, 30 * i + 30);
        ctx.fillText(data['users'][i].score, 300, 30 * i + 30);
    }
});


socket.on('fuck', function()
{
    console.log('fuck is recieved');
});



socket.on('get_username', function(data, cb) ///////////// function() ???
{
    $.ajax({
        url: 'http://tuna.com.ru/game/myapi_username/',
        //url: "http://127.0.0.1:8000/game/myapi_username/",
        xhrFields:
        {
            withCredentials: true
        },
    })
    .done(function(res) {        
        console.log(res);
        //socket.emit('username_result', {username: res['username']});
        if (res['username'] == 'AnonymousUser')
        {
            console.log('anon');
            window.location.replace('/account/login');
            return;
        }
        cb(res['username']);
    })
});


socket.on('winner', function(data1)
{
    console.log(JSON.stringify(data1));
    data2 = JSON.stringify(data1);
    $.ajax(
    {
        url: "http://tuna.com.ru/game/myapi_winner/",
        //url: "http://127.0.0.1:8000/game/myapi_winner/",
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
         



    
/*

var ctx = document.getElementById("ctx").getContext("2d");
ctx.font = '30px Arial';

var socket = io();

socket.on('newPositions',function(data){
    ctx.clearRect(0,0,500,500);
    for(var i = 0 ; i < data.length; i++)
        ctx.fillText(data[i].number,data[i].x,data[i].y);
});

socket.on('fuck', function(data){
    console.log(data.a);
});
*/











//////////////////

var happy = function()
{
    socket.emit('happy');
}

var aja = function()
{
    $.ajax({

        url: 'http://127.0.0.1:8000/myapi',
        xhrFields: {

            withCredentials: true
        },
    })
        .done(function(res) {
            
            console.log(res);
        })
    /*
    $.ajax('http://127.0.0.1:8000/myapi', {

        'method': 'GET',
        'success': function(err, res, body) {

            if ( res.code == 200 )
            {
                //alert('ok');
            }
            else
            {
                //alert('error!');
            }
            if (err)
            {
                alert(err);
            }
        }
    });
    */
}
