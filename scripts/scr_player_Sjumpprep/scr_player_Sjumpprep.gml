function scr_player_Sjumpprep() //scr_player_Sjumpprep
{
    input_get()
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    if (sprite_index == spr_player_mach2jump)
    {
        if (floor(image_index) == (image_number - 1))
            state = states.mach2
    }
    else
    {
        movespeed = 4
        mach2 = 0
        if (floor(image_index) == (image_number - 1))
        {
            sound_play(sfx_plane, false, (2 << 0))
            state = states.Sjump
            sprite_index = spr_player_superjump
            vsp = -21
        }
    }
    image_speed = 0.35
    perform_collisions()
}

