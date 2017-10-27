var express = require('express');
var app = express();
var serv = require('http').Server(app);
var http = require('http');

var request = require('request');

app.get('/', function(req, res) {
    res.sendFile(__dirname + '/client/index.html');
});
app.use('/client', express.static(__dirname + '/client'));

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

function allEmit(message, data)
{
    for (var i in socket_list)
    {
        socket_list[i].emit(message, data);
    }
}



var io = require('socket.io')(serv, {});
io.sockets.on('connection', function(socket)
{
    socket.emit('get_username', {}, function(result)
    {
        //console.log(data);
        //console.log(data.username);
        console.log('result is found');
        socket.username = result;
    });
    

    setTimeout(function()
    {
        socket.on('username_result', function(data)
                  {
                      console.log('fuck its not cool');
                      console.log(data.username);
                      socket.username = data.username
                  });
        
        console.log('socket connection');

        socket.id = idx++;
        socket_list.push(socket);

        temp = []
        for (var i in socket_list)
        {
            temp.push(socket_list[i].username)
        }

        console.log(temp);
        allEmit('new_user',
        {
            'users': temp,
            'count': temp.length,
        });
    }, 500);
        /*
    for (var i in socket_list)
    {
        socket_list[i].emit('update', {'cnt': socket_list.length});
    }
    //socket.emit('update', {cnt: Math.random()});
    */

    
    socket.on('disconnect', function()
    {
        for (var i in socket_list)
        {
            if (socket_list[i].id == socket.id)
            {
                socket_list.splice(i, 1);
            }
        }

        
        temp = []
        for (var i in socket_list)
        {
            temp.push(socket_list[i].username)
        }

        allEmit('new_user',
        {
            'users': temp,
            'count': temp.length,
        }); 
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
