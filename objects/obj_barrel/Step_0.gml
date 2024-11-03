if (vsp < 12)
    vsp += grav
if grounded
{
    hsp = 0
    bounce = 0
}
if (place_meeting((x - 5), y, obj_player) && obj_player.xscale == 1 && (obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.suplexdash) && bounce == 0)
{
    vsp = -5
    hsp = 5
    bounce = 1
    obj_player.state = states.tackle
    obj_player.image_index = 0
    obj_player.mach2 = 0
    sound_play(sfx_bump, false, (1 << 0), true)
}
if (place_meeting((x + 5), y, obj_player) && obj_player.xscale == -1 && (obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.suplexdash) && bounce == 0)
{
    vsp = -5
    hsp = -5
    bounce = 1
    obj_player.state = states.tackle
    obj_player.image_index = 0
    obj_player.mach2 = 0
    sound_play(sfx_bump, false, (1 << 0), true)
}
perform_enemy_collisions()
