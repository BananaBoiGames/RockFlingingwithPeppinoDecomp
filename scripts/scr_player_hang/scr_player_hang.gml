function scr_player_hang() //scr_player_hang
{
    input_get()
    hsp = 0
    vsp = 0
    mach2 = 35
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    image_speed = 0.35
    perform_collisions()
}

