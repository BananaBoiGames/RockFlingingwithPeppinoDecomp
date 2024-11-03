if surface_exists(surf)
{
    surface_set_target(surf)
    draw_set_color(c_black)
    draw_set_alpha(0.85)
    draw_rectangle(0, 0, room_width, room_height, false)
    draw_set_blend_mode(3)
    draw_set_color(c_white)
    for (i = 0.2; i < 0.4; i += 0.1)
    {
        draw_set_alpha(i)
        with (obj_light)
            draw_roundrect((x + (random_range(-1, 1))), (y - (240 - 120 * other.i) + (random_range(-1, 1))), (bbox_right + (random_range(-1, 1))), (bbox_bottom + (random_range(-1, 1))), false)
    }
    draw_set_blend_mode(0)
    draw_set_alpha(1)
    draw_set_color(c_white)
    surface_reset_target()
}
else
{
    surf = surface_create(room_width, room_height)
    surface_set_target(surf)
    draw_clear_alpha(c_black, 0)
    surface_reset_target()
}
