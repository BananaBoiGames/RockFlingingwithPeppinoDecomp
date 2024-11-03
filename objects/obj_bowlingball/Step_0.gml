if (obj_player.x > (x - 8) && obj_player.x < (x + 8) && obj_player.y > y && falling == 0)
{
    vsp = 15
    falling = 1
}
if (falling == 1)
{
    sprite_index = spr_bowlingballfalling
    x += hsp
    y += floor(vsp)
    if (vsp < 30)
        vsp += grav
}
