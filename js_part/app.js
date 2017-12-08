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
var curPlayers = {'red': '', 'green': ''};

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
        setLabels();
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

        for (var color in curPlayers)
        {
            if (curPlayers[color] == socket.username)
            {
                curPlayers[color] = '';
                setLabels();
            }
        }

        updateUsersList();
    });

    socket.on('newChatMsg', function(data)
    {        
        var message = '<b>' + data['username'] + '</b>: ' + data['text'];
        allEmit('addToChat', message);
    });
        
    socket.on('pressed', pressedButton);
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


function pressedButton(data)
{
    var cur = data['color'];
    var secon = cur == 'red' ? 'green' : 'red';
   
    if (curPlayers[cur] == '')
    {
        curPlayers[cur] = data['username'];
        if (curPlayers[secon] == data['username'])
        {
            curPlayers[secon] = '';
        }
    }
    else
    {
        curPlayers[cur] = '';
    }

    setLabels();
}


function setLabels()
{
    var response = {'': {'red': {}, 'green': {}}};
    for (var pos in curPlayers)
    {
        response[curPlayers[pos]] = {'red': {}, 'green': {}};
    }
    
    for (var pos in curPlayers)
    {
        if (curPlayers[pos] == '')
        {
            for (var user in response)
            {
                response[user][pos].type = 'take';
                response[user][pos].display = 'inline-block';

                response[user][pos].label = '     * * *';
            }            
        }
        else
        {
            for (var user in response)
            {
                if (user == curPlayers[pos])
                {
                    response[user][pos].type = 'stand';
                    response[user][pos].display = 'inline-block';
                }
                else
                {
                    response[user][pos].display = 'none';
                }

                response[user][pos].label = curPlayers[pos];
            }
        }
    }

    for (var user in socketList)
    {
        for (var i in socketList[user])
        {
            if (user in response)
            {
                socketList[user][i].emit('updateHeader', response[user]);  
            }
            else
            {
                socketList[user][i].emit('updateHeader', response['']);
            }
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
