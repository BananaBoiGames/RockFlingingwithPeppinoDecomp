if (obj_player.state != states.hurt && global.shroomfollow == 0)
{
    ds_list_add(global.saveroom, id)
    sound_play(sfx_collectToppin, false, (1 << 0))
    global.shroomfollow = 1
    panic = 0
}
