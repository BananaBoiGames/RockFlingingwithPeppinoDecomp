if (obj_player.state != states.hurt && global.cheesefollow == 0)
{
    ds_list_add(global.saveroom, id)
    sound_play(sfx_collectToppin, false, (1 << 0))
    global.cheesefollow = 1
    panic = 0
}
