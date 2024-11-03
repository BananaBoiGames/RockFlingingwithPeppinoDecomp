function scr_player_gameover() //scr_player_gameover
{
    input_get()
    sprite_index = spr_player_dead
    x += hsp
    y += floor(vsp)
    if (vsp < 30)
        vsp += grav
}

