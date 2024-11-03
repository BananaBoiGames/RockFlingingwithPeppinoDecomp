function scr_player_bossdefeat() //scr_player_bossdefeat
{
    input_get()
    if (a != 255)
        a += 1
    image_blend = make_color_rgb(a, a, a)
    obj_camera.visible = false
    sprite_index = spr_player_bossdefeat
    perform_collisions()
}

