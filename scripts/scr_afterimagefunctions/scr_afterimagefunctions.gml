function create_afterimage(argument0, argument1, argument2, argument3) //create_afterimage
{
    var q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: argument2,
        image_index: argument3,
        alarm: [15, 3, -1],
        image_blend: choose(make_colour_rgb(255, 0, 0), make_colour_rgb(0, 255, 0)),
        image_xscale: 1,
        identifier: (0 << 0),
        visible: true,
        alpha: 1
    }

    ds_list_add(global.afterimage_list, q)
    return q;
}

function create_mach2effect(argument0, argument1, argument2, argument3) //create_mach2effect
{
    q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: argument2,
        image_index: argument3,
        alarm: [5, -1, -1],
        image_blend: c_white,
        image_xscale: obj_player.xscale,
        visible: true,
        identifier: (1 << 0),
        alpha: 0.3
    }

    ds_list_add(global.afterimage_list, q)
    return q;
}

function create_mach3effect(argument0, argument1, argument2, argument3) //create_mach3effect
{
    q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: argument2,
        image_index: argument3,
        alarm: [15, 3, -1],
        image_blend: make_color_hsv(choose(0, 100, 200), 255, 255),
        image_xscale: obj_player.xscale,
        visible: true,
        identifier: (2 << 0),
        alpha: 0.8
    }

    ds_list_add(global.afterimage_list, q)
    return q;
}

