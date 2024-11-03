for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        if visible
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, alpha)
    }
}
