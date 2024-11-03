function scr_player_freefallland() //scr_player_freefallland
{
    input_get()
    mach2 = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = false
    movespeed = 0
    if global.upgrade_bodyslam
        facehurt = true
    vsp = 0
    hsp = 0
    if (floor(image_index) == (image_number - 1) && (superslam <= 30 || global.upgrade_bodyslam))
        state = states.normal
    if (floor(image_index) == (image_number - 1) && superslam > 30 && (!global.upgrade_bodyslam))
    {
        state = states.machfreefall
        vsp = -7
    }
    image_speed = 0.35
    perform_collisions()
}

