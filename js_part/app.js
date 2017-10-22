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

var io = require('socket.io')(serv, {});
io.sockets.on('connection', function(socket)
{
    console.log('socket connection');

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
