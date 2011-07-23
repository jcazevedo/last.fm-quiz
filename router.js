function route(handle, pathname)
{
    console.log("About to route a request for "+pathname);
    if (typeof handle[pathname] === 'function')
    {
        handle[pathname]();
    }
    else
    {
        console.log("No request handler is found for "+pathname);
    }
}

exports.route = route;