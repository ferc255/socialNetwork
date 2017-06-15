function myfunc(x)
{
    var nextElem = x.nextElementSibling;
    if (nextElem.className == 'dropdown-content')
    {
        nextElem.className = 'dropdown-content2';
        x.className = 'navbar-b';
    }
    else
    {
        nextElem.className = 'dropdown-content';
        x.className = 'navbar-a';
    }

}
