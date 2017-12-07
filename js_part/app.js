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

var idx = 0;
var socketList = [];


var io = require('socket.io')(serv, {});
io.sockets.on('connection', function(socket)
{
    socket.emit('get_username', {}, function(result)
    {
        socket.username = result;
        socket.score = 0;
        socket.id = idx++;
        if (!socketList[socket.username])
        {
            socketList[socket.username] = [];
        }
        socketList[socket.username].push(socket);

        updateUsersList();
    });

    socket.on('newChatMsg', function(data)
    {        
        var message = '<b>' + data['username'] + '</b>: ' + data['text'];
        allEmit('addToChat', message);
    });
        
    socket.on('disconnect', function()
    {
        for (var i in socketList)
        {
            for (var j in socketList[i])
            {
                if (socketList[i][j].id == socket.id)
                {
                    socketList[i].splice(j, 1);
                }
            }
        }

        updateUsersList();
    }); 
});


function allEmit(message, data)
{
    for (var i in socketList)
    {
        for (var j in socketList[i])
        {
            socketList[i][j].emit(message, data);
        }
    }
}


function updateUsersList()
{    
    usersOnline = [];
    for (var i in socketList)
    {
        if (socketList[i].length > 0)
        {
            usersOnline.push(i);
        }
    }

    allEmit('updateUsersList', usersOnline);
}
