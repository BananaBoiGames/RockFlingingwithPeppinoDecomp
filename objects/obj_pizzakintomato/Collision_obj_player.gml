if (obj_player.state != states.hurt && global.tomatofollow == 0)
{
    ds_list_add(global.saveroom, id)
    sound_play(sfx_collectToppin, false, (1 << 0))
    global.tomatofollow = 1
    panic = 0
}
