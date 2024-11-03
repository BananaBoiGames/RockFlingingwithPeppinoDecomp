for (var i = 0; i < image_xscale; i++)
{
    for (var j = 0; j < image_yscale; j++)
        draw_sprite_ext(sprite_index, image_index, (xstart + i * sprite_get_width(sprite_index)), (ystart + j * sprite_get_height(sprite_index)), 1, 1, image_angle, image_blend, image_alpha)
}
