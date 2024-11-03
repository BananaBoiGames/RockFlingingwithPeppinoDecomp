if (obj_player.bbox_bottom < y && created == 0 && (obj_player.state == states.mach2 || obj_player.state == states.mach3))
{
    alarm[0] = 2
    created = 1
}
