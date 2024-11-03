if (place_meeting((x + 1), y, obj_solid) || place_meeting((x - 1), y, obj_solid))
    instance_destroy()
if (vsp < 12)
    vsp += grav
if (place_meeting((x - 5), y, obj_player) && obj_player.xscale == 1 && (obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3) && rolling == 0)
{
    rolling = 1
    hsp = 7
    obj_player.state = states.tackle
    obj_player.image_index = 0
    obj_player.mach2 = 0
    sound_play(sfx_bump, false, (1 << 0), true)
}
if (place_meeting((x + 5), y, obj_player) && obj_player.xscale == -1 && (obj_player.state == states.mach1 || obj_player.state == states.mach2) && rolling == 0)
{
    rolling = 1
    hsp = -7
    obj_player.state = states.tackle
    obj_player.image_index = 0
    obj_player.mach2 = 0
    sound_play(sfx_bump, false, (1 << 0), true)
}
perform_solid_collisions()
