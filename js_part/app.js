var express = require('express');
var app = express();
var serv = require('http').Server(app);
var http = require('http');

var request = require('request');

app.get('/connect4', function(req, res) {
    res.sendFile(__dirname + '/client/index.html');
});
app.use('/connect4/client', express.static(__dirname + '/client'));

serv.listen(2000);
console.log("Server started");






/////////////////////////////////////////////

var socket_list = [];
var idx = 0;

function mypr(data)
{
    console.log(data.length);
    for (var it in data)
    {
        console.log(it, data[it].id);
    }
    console.log('---------------------');
}

function allEmit()
{
    temp = [];
    for (var i in socket_list)
    {
        temp.push(
        {
            username: socket_list[i].username,
            score: socket_list[i].score,
        });
    }
    data = {'users': temp};
    
    for (var i in socket_list)
    {
        socket_list[i].emit('draw', data);
    }
}



var io = require('socket.io')(serv, {});
io.sockets.on('connection', function(socket)
{
    //console.log('new_connection');
    socket.emit('get_username', {}, function(result)
    {
        console.log('ajax result = ', result);
        socket.username = result;

        socket.secret_phrase = 'django_the_best';
        socket.id = idx++;
        socket.score = 0;
        socket_list.push(socket);

        temp = []
        for (var i in socket_list)
        {
            temp.push(socket_list[i].username)
        }

        //console.log('temp =', temp);
        allEmit();
    });         

    socket.on('new_point', function()
    {
        socket.score++;
        if (socket.score == 5)
        {
            if (socket.username != "AnonymousUser")
            {
                socket.emit('winner', {username: socket.username});
            }
            for (var i in socket_list)
            {
                socket_list[i].score = 0;
            }
        }
        allEmit();
    });






        
    socket.on('disconnect', function()
    {
        for (var i in socket_list)
        {
            if (socket_list[i].id == socket.id)
            {
                socket_list.splice(i, 1);
            }
        }

        allEmit();
    }); 
});




    
/*
    socket.on('happy', function()
    {
        console.log('happy');

        var mydata =
        {
            reque: 'slice'
        }
        var url = 'http://127.0.0.1:8000/myapi'
        var options =
        {
            method: 'post',
            body: mydata,
            json: true,
            url: url
        };

        //console.log(window.document.cookie);

        request(options, function(err, res, body)    //err, res, body)
        {
            console.log(res.body['resp'] + 4);
        });
    });
    
    
});

*/

/*
var express = require('express');
var app = express();
var serv = require('http').Server(app);

app.get('/',function(req, res) {
    res.sendFile(__dirname + '/client/index.html');
});
app.use('/client',express.static(__dirname + '/client'));

serv.listen(2000);
console.log("Server started.");

var SOCKET_LIST = {};

var io = require('socket.io')(serv,{});
io.sockets.on('connection', function(socket){
    socket.id = Math.random();
    socket.x = 0;
    socket.y = 0;
    socket.number = "" + Math.floor(10 * Math.random());
    SOCKET_LIST[socket.id] = socket;
    


    socket.on('disconnect',function(){
        delete SOCKET_LIST[socket.id];
    });

});

    socket.emit('fuck', {a: Math.floor(Math.random() * 10)});

setInterval(function(){
    var pack = [];
    for(var i in SOCKET_LIST){
        var socket = SOCKET_LIST[i];
        socket.x++;
        socket.y++;
        pack.push({
            x:socket.x,
            y:socket.y,
            number:socket.number
        });
    }
    for(var i in SOCKET_LIST){
        var socket = SOCKET_LIST[i];
        socket.emit('newPositions',pack);
    }




},1000/25);

*/
