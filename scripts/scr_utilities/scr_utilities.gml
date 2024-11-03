function instance_create(argument0, argument1, argument2) //instance_create
{
    var inst = instance_create_depth(argument0, argument1, 0, argument2)
    return inst;
}

function point_in_camera(argument0, argument1, argument2, argument3) //point_in_camera
{
    if (argument3 == undefined)
        argument3 = 0
    var cam_x = camera_get_view_x(argument2)
    var cam_y = camera_get_view_y(argument2)
    var cam_w = camera_get_view_width(argument2)
    var cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, (cam_x - argument3), cam_y, (cam_x + cam_w + argument3), (cam_y + cam_h));
}

function wave(argument0, argument1, argument2, argument3, argument4) //wave
{
    if (argument4 == undefined)
        argument4 = -4
    var a4 = (argument1 - argument0) * 0.5
    var t = current_time
    if (argument4 != -4)
        t = argument4
    return (argument0 + a4 + (sin((t * 0.001 + argument2 * argument3) / argument2 * (2 * pi))) * a4);
}

function approach(argument0, argument1, argument2) //approach
{
    if (argument0 < argument1)
    {
        argument0 += argument2
        if (argument0 > argument1)
            return argument1;
    }
    else
    {
        argument0 -= argument2
        if (argument0 < argument1)
            return argument1;
    }
    return argument0;
}

function concat() //concat
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    return _string;
}

function trace() //trace
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    show_debug_message(_string)
}

function worldmap_get_sprite(argument0) //worldmap_get_sprite
{
    var sprdir = ""
    if (vdir == -1)
        sprdir = "_up"
    else if (vdir == 1)
        sprdir = "_down"
    else if (hdir == -1)
        sprdir = "_left"
    else if (hdir == 1)
        sprdir = "_right"
    if (sprdir == "")
        return sprite_index;
    var newspr = asset_get_index(argument0 + sprdir)
    return newspr;
}

function sign_test(argument0, argument1, argument2, argument3, argument4, argument5) //sign_test
{
    return ((argument2 - argument0) * (argument5 - argument1) - (argument3 - argument1) * (argument4 - argument0));
}

