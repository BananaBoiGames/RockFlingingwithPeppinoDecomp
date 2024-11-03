if (obj_player.state != states.hurt && global.pineapplefollow == 0)
{
    ds_list_add(global.saveroom, id)
    sound_play(sfx_collectToppin, false, (1 << 0))
    global.pineapplefollow = 1
    panic = 0
}
