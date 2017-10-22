var socket = io();
console.log("hi ok");

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
