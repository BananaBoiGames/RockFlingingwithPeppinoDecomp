function scr_player_Sjumpland() //scr_player_Sjumpland
{
    input_get()
    mach2 = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = false
    movespeed = 0
    vsp = 0
    hsp = 0
    sprite_index = spr_player_superjumpland
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_fall
        state = states.jump
        jumpAnim = false
    }
    perform_collisions()
}

