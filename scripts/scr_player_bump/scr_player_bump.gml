function scr_player_bump() //scr_player_bump
{
    input_get()
    movespeed = 0
    mach2 = 0
    if (grounded && vsp > 0)
        hsp = 0
    if (floor(image_index) == (image_number - 1))
        state = states.normal
    sprite_index = spr_player_bump
    image_speed = 0.35
    perform_collisions()
}

