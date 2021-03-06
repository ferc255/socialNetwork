COLS = 26, ROWS = 26;
var EMPTY = 0, SNAKE = 1, FRUIT = 2;
var LEFT = 0, UP = 1, RIGHT = 2, DOWN = 3;
var KEY_LEFT=37, KEY_UP = 38, KEY_RIGHT = 39, KEY_DOWN = 40;

var grid =
{
	width: null,
    height: null,
    _grid: null,

    init: function(d, c, r)
    {
        this.width = c;
        this.height = r;
        this._grid = [];

        for (let x = 0; x < c; x++)
        {
            this._grid.push([]);
            for (let y = 0; y < r; y++)
            {
                this._grid[x].push(d);
            }
        }
    },

    set: function(val, x, y)
    {
        this._grid[x][y] = val;
    },

    get: function(x, y)
    {
        return this._grid[x][y];
    },
};

var snake =
{
	direction: null,
    last: null,
    _queue: null,

    init: function(d, x, y)
    {
        this.direction = d;

        this._queue = [];
        this.insert(x, y);
    },

    insert: function(x, y)
    {
        this._queue.unshift({x:x, y:y});
        this.last = this._queue[0];
    },

    remove: function()
    {
        return this._queue.pop();
    },
};


function setFood()
{
    var empty = [];
    for (let x = 0; x < grid.width; x++)
    {
        for (let y = 0; y < grid.height; y++)
        {
            if (grid.get(x, y) === EMPTY)
            {
                empty.push({x:x, y:y});
            }
        }
    }

    var randpos = empty[Math.floor(Math.random()*empty.length)];
    grid.set(FRUIT, randpos.x, randpos.y);
}

// Game objects
var canvas, ctx, keystate, frames, score;

function main()
{
    canvas = document.createElement("canvas");
    canvas.width = COLS*20;
    canvas.height = ROWS*20;
    ctx = canvas.getContext("2d");
    document.body.appendChild(canvas);

    frames = 0;
    keystate = {};
    document.addEventListener("keydown", function(evt)
    {
		keystate[evt.keyCode] = true;
    });
    document.addEventListener("keyup", function(evt)
    {
        delete keystate[evt.keyCode];
    });

    init();
    loop();
}

function init()
{
    score = 0;
    grid.init(EMPTY, COLS, ROWS);

    var sp = {x:Math.floor(COLS/2), y:ROWS-1};
    snake.init(UP, sp.x, sp.y);
    grid.set(SNAKE, sp.x, sp.y);

    setFood();
}

function loop()
{
    update();
    draw();

    window.requestAnimationFrame(loop, canvas);
   
}

function update()
{
    frames++;

    if (frames % 10 == 0)
 {
    if (keystate[KEY_LEFT] && snake.direction != RIGHT && keystate.length == 1)
    {
        snake.direction = LEFT;
    } else
    if (keystate[KEY_UP] && snake.direction != DOWN && keystate.length == 1)
    {
        snake.direction = UP;
    } else
    if (keystate[KEY_RIGHT] && snake.direction != LEFT && keystate.length == 1)
    {
        snake.direction = RIGHT;
    }else
    if (keystate[KEY_DOWN] && snake.direction != UP && keystate.length == 1)
    {
        snake.direction = DOWN;
    }
	 alert("j");

        var nx = snake.last.x;
        var ny = snake.last.y;

        switch (snake.direction)
        {
            case LEFT:
                nx--;
                break;
            case UP:
                ny--;
                break;
            case RIGHT:
                nx++;
                break;
            case DOWN:
                ny++;
                break;            
        }

        if (nx < 0 || nx >= grid.width ||
            ny < 0 || ny >= grid.height ||
           grid.get(nx, ny) === SNAKE)
        {
            return init();
        }

        if (grid.get(nx, ny) === FRUIT)
        {
            score++;
            var tail = {x:nx, y:ny};
            setFood();
        }
        else
        {
            var tail = snake.remove();
            grid.set(EMPTY, tail.x, tail.y);
            tail.x = nx;
            tail.y = ny;
        }

        
        grid.set(SNAKE, tail.x, tail.y);

        snake.insert(tail.x, tail.y);
    }
}

function draw()
{
    var tw = canvas.width/grid.width;
    var th = canvas.height/grid.height;

    for (let x = 0; x < grid.width; x++)
    {
        for (let y = 0; y < grid.height; y++)
        {
            switch (grid.get(x, y))
            {
                case EMPTY:
                    ctx.fillStyle = "#fff";
                    break;
                case SNAKE:
                    ctx.fillStyle = "#08f";
                    break;
                case FRUIT:
                    ctx.fillStyle = "#f00";
                    break;                
            }
            ctx.fillRect(x*tw, y*tw, tw, th);
        }
    }
    ctx.fillStyle = "#000";
    ctx.fillText("SCORE: " + score, 10, canvas.height - 10);
}

main();

