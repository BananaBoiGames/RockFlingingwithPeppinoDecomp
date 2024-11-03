function scr_player_comingoutdoor() //scr_player_comingoutdoor
{
    input_get()
    mach2 = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    hsp = 0
    vsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        movespeed = 0
        state = states.normal
        image_alpha = 1
    }
    sprite_index = spr_player_walkfront
    image_speed = 0.35
}

