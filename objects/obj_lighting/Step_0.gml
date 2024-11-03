if surface_exists(surf)
{
    surface_set_target(surf)
    draw_set_color(c_black)
    draw_set_alpha(0.4)
    draw_rectangle(0, 0, room_width, room_height, false)
    draw_set_blend_mode(3)
    draw_set_color(c_white)
    if (!noplayer)
    {
        with (obj_player)
            draw_circle((x + (random_range(-1, 1))), (y + (random_range(-1, 1))), (300 + (random_range(-1, 1))), 0)
    }
    if noplayer
    {
        with (obj_lamp)
            draw_circle((x + (random_range(-1, 1))), (y + (random_range(-1, 1))), ((other.noplayer ? 180 : 40) + (random_range(-1, 1))), 0)
    }
    draw_set_color(c_white)
    draw_set_alpha(1)
    if (!noplayer)
    {
        with (obj_player)
            draw_circle((x + (random_range(-1, 1))), (y + (random_range(-1, 1))), (250 + (random_range(-1, 1))), 0)
    }
    with (obj_lamp)
        draw_circle((x + (random_range(-1, 1))), (y + (random_range(-1, 1))), ((other.noplayer ? 140 : 40) + (random_range(-1, 1))), 0)
    draw_set_blend_mode(0)
    draw_set_alpha(1)
    surface_reset_target()
}
else
{
    surf = surface_create(room_width, room_height)
    surface_set_target(surf)
    draw_clear_alpha(c_black, 0)
    surface_reset_target()
}