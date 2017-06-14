var COLS = 20, ROWS = 20, CELLSIZE = 25;
var CELL =
{
    EMPTY: 0,
    X: 1,
    O: 2,
}
//
var ctx, canvas, grid;

function loop()
{
    
}

function drawX(x, y)
{
    ctx.beginPath();
    ctx.lineWidth = 2;
    ctx.strokeStyle = "#0000FF";
    
    ctx.moveTo(x * CELLSIZE, y * CELLSIZE);
    ctx.lineTo((x + 1) * CELLSIZE, (y + 1) * CELLSIZE);
    ctx.stroke();

    ctx.moveTo((x + 1) * CELLSIZE, y * CELLSIZE);
    ctx.lineTo(x * CELLSIZE, (y + 1) * CELLSIZE);
    ctx.stroke();
    
    ctx.closePath();
}

function drawO(x, y)
{
    ctx.beginPath();
    ctx.lineWidth = 2;
    ctx.strokeStyle = "#0000FF";

    ctx.arc((x + 0.5) * CELLSIZE, (y + 0.5) * CELLSIZE, 0.5 * CELLSIZE, 0, 2 * Math.PI);
    ctx.stroke();

    ctx.closePath();
}

function AImove()
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
    console.log("empty.length = ", empty.length);

    var chosen = empty[Math.floor(Math.random() * empty.length)];
    console.log("chosen = ", chosen);
    grid[chosen.row][chosen.col] = CELL.O;
    drawO(chosen.col, chosen.row);
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
    console.log("cnt ", count());
    grid[row][col] = CELL.X;
    console.log("cnt2 ", count());
    drawX(col, row);
}

function mouseClick(event)
{
    console.log(grid);
    var x = event.pageX;
    var y = event.pageY;
    x -= canvas.offsetLeft;
    y -= canvas.offsetTop;

    var col = Math.floor(x / CELLSIZE);
    var row = Math.floor(y / CELLSIZE);

    console.log(row, col, grid[row][col]);
    for (let i = 0; i < 5; i++)
    {
        console.log(grid[i][0]);
    }
    if (grid[row][col] === CELL.EMPTY)
    {
        playerMove(row, col);
        AImove();
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
    console.log("grid.length = ", grid.length, "\ngrid[0].length = ", grid[0].length);
    console.log(grid);

}

main();
