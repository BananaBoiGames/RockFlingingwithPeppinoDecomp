if (place_meeting((x + 1), y, obj_solid) || place_meeting((x - 1), y, obj_solid))
    hsp = 0
if (place_meeting((x - 5), y, obj_player) && obj_player.xscale == 1 && (obj_player.state == states.mach1 || obj_player.state == states.mach2) && rolling == 0)
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
with (obj_player)
{
    if place_meeting(x, (y + 1), obj_ball)
    {
        if (state == states.freefall)
        {
            state = states.Sjump
            sprite_index = spr_player_superjump
            vsp = -15
        }
        else
            vsp = -8
        jumpAnim = false
    }
}
