if (enemydropped && ds_list_find_index(global.saveroom, id) == -1)
{
    var _collectlist = {}
    with (_collectlist)
    {
        collectroom = room
        x = other.x
        y = other.y
    }
    show_debug_message(string(_collectlist.x))
    if (ds_list_find_index(global.collectlist, _collectlist) == -1)
        ds_list_add(global.collectlist, _collectlist)
}
