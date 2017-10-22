var COLS = 20, ROWS = 20, CELLSIZE = 25;
var CELL =
{
    EMPTY: 0,
    X: 1,
    O: 2,
}
//
var ctx, canvas, grid, ended = false, last, chosen;


function drawX(x, y, color)
{
    ctx.beginPath();
    ctx.lineWidth = 2;
    ctx.strokeStyle = color;
    
    ctx.moveTo(x * CELLSIZE, y * CELLSIZE);
    ctx.lineTo((x + 1) * CELLSIZE, (y + 1) * CELLSIZE);
    ctx.stroke();

    ctx.moveTo((x + 1) * CELLSIZE, y * CELLSIZE);
    ctx.lineTo(x * CELLSIZE, (y + 1) * CELLSIZE);
    ctx.stroke();
    
    ctx.closePath();
}

function drawO(x, y, color)
{
    ctx.beginPath();
    ctx.lineWidth = 2;
    ctx.strokeStyle = color;

    ctx.arc((x + 0.5) * CELLSIZE, (y + 0.5) * CELLSIZE, 0.5 * CELLSIZE, 0, 2 * Math.PI);
    ctx.stroke();

    ctx.closePath();
}


function check_state(i, j, di, dj)
{
    var cnt = 0;
    for (let k = 0; k < 5; k++)
    {
        if (grid[i + di*k][j + dj*k] === CELL.O)
        {
            return false;
        }
        if (grid[i + di*k][j + dj*k] === CELL.EMPTY)
        {
            cnt++;
            chosen = {row:i + di*k, col:j + dj*k};
        }
    }

    return cnt <= 2;
}


function AImove()
{
    var found = false;
    for (let i = 0; i < grid.length; i++)
    {
        for (let j = 0; j < grid.length; j++)
        {
            if (i + 4 < grid.length && check_state(i, j, 1, 0))
            {
                found = true;
                break;
            }                
            if (j + 4 < grid[i].length && check_state(i, j, 0, 1))
            {
                found = true;
                break;
            }
            if (i + 4 < grid.length && j + 4 < grid[i].length
                && check_state(i, j, 1, 1))
            {
                found = true;
                break;
            }
            if (i - 4 >= 0 && j + 4 < grid[i].length &&
                check_state(i, j, -1, 1))
            {
                found = true;
                break;
            }
        }
        
        if (found)
        {
            break;
        }
    }

    if (!found)
    {
        var empty = [];
        for (let i = 0; i < grid.length; i++)
        {
            for (let j = 0; j < grid[i].length; j++)
            {
                if (grid[i][j] === CELL.EMPTY)
                {
                    empty.push({row: i, col: j});
                }
            }
        }
        chosen = empty[Math.floor(Math.random() * empty.length)];
    } 
    
    grid[chosen.row][chosen.col] = CELL.O;
    drawO(chosen.col, chosen.row, "#FF0000");
    last = {row: chosen.row, col: chosen.col};
}

function count()
{
    var res = 0;
    for (let i = 0; i < grid.length; i++)
    {
        for (let j = 0; j < grid[i].length; j++)
        {
            if (grid[i][j] === CELL.EMPTY)
            {
                res++;
            }
        }
    }
    return res;
}

function playerMove(row, col)
{
    grid[row][col] = CELL.X;
    drawX(col, row, "#0000FF");
}


function finish(gameResult)
{
    ended = true;
    var labelVerdict = document.createElement("h1");
    labelVerdict.style.textAlign = "center";
    var text = document.createTextNode(gameResult);
    labelVerdict.appendChild(text);
//    labelVerdict.text = "loool";
//    document.body.appendChild(labelVerdict);
    document.body.insertBefore(labelVerdict, canvas);
}


function check_iterate(i, j, di, dj)
{
    let found = false;
    for (let k = 1; k <= 4; k++)
    {
        if (grid[i + di*k][j + dj*k] != grid[i][j])
        {
            found = true;
            break;
        }
    }

    if (!found)
    {
        drawO(last.col, last.row, "#0000FF");
        for (let k = 0; k < 5; k++)
        {
            if (grid[i][j] === CELL.X)
            {
                drawX(j + dj*k, i + di*k, "#FF0000");
            }
            else
            {
                drawO(j + dj*k, i + di*k, "#FF0000");
            }
        }

        if (grid[i][j] === CELL.X)
        {
            finish("You won!");
        }
        else
        {
            finish("You lost!");
        }
        return true;
    }
    return false;
}


function check()
{
    for (let i = 0; i < grid.length; i++)
    {
        for (let j = 0; j < grid[i].length; j++)
        {
            if (grid[i][j] != CELL.EMPTY)
            {
                if (i + 4 < grid.length && check_iterate(i, j, 1, 0))
                {
                    return;
                }                
                if (j + 4 < grid[i].length && check_iterate(i, j, 0, 1))
                {
                    return;
                }
                if (i + 4 < grid.length && j + 4 < grid[i].length
                    && check_iterate(i, j, 1, 1))
                {
                   return;
                }
                if (i - 4 >= 0 && j + 4 < grid[i].length &&
                    check_iterate(i, j, -1, 1))
                {
                    return;
                }                        
            }
        }
    }

    if (count() === 0)
    {
        finish("Draw!");
    }
}


function mouseClick(event)
{
    if (ended)
    {
        return;
    }

    var x = event.pageX;
    var y = event.pageY;
    x -= canvas.offsetLeft;
    y -= canvas.offsetTop;

    var col = Math.floor(x / CELLSIZE);
    var row = Math.floor(y / CELLSIZE);

    if (grid[row][col] === CELL.EMPTY)
    {
        if (typeof last !== "undefined")
        {
            drawO(last.col, last.row, "#0000FF");
        }
        playerMove(row, col);
        check();
        if (ended)
        {
            return;
        }
        AImove();
        check();
    }
}

function main()
{
    canvas = document.createElement("canvas");
    canvas.width = COLS * CELLSIZE;
    canvas.height = ROWS * CELLSIZE;
    ctx = canvas.getContext("2d");
    document.body.appendChild(canvas);

    canvas.addEventListener("click", mouseClick, false);

    ctx.beginPath();
    ctx.strokeStyle = "#BBBBFF";
    for (let i = 1; i < ROWS; i++)
    {
        ctx.moveTo(0, i * CELLSIZE);
        ctx.lineTo(COLS * CELLSIZE, i * CELLSIZE);
        ctx.stroke();
    }
    for (let j = 1; j < COLS; j++)
    {
        ctx.moveTo(j * CELLSIZE, 0);
        ctx.lineTo(j * CELLSIZE, ROWS * CELLSIZE);
        ctx.stroke();
    }
    ctx.closePath();
    //setInterval(loop, 2000);

    grid = Array(ROWS);
    for (let i = 0; i < grid.length; i++)
    {
        grid[i] = Array(COLS).fill(CELL.EMPTY);
    }
}

main();
