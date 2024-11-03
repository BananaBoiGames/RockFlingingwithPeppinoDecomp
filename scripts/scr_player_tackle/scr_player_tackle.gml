function scr_player_tackle() //scr_player_tackle
{
    input_get()
    movespeed = 0
    mach2 = 0
    if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0)
        hsp = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    if (floor(image_index) == (image_number - 1))
        state = states.normal
    sprite_index = spr_player_tackle
    image_speed = 0.35
    perform_collisions()
}

