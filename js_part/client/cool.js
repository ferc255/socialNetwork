
var canv = document.getElementById("canv");
var ctx = canv.getContext("2d");


var socket = io();
console.log("hi ok");


socket.on('update', function(data)
{
    console.log('fuck');
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, 100, 100);
    ctx.fillStyle = "black";
    ctx.font = "30px Arial";
    ctx.fillText(data.cnt, 30, 30);
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
