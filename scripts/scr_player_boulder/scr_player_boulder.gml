function scr_player_boulder() //scr_player_boulder
{
    input_get()
    landAnim = true
    movespeed = 4
    mach2 = 0
    sprite_index = spr_player_slipnslide
    image_speed = 0.35
    perform_solid_collisions()
}

