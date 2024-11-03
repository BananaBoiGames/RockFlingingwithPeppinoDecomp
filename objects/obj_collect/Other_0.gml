if enemydropped
{
    global.collect += 10
    instance_create(obj_player.x, (obj_player.y - 30), obj_10)
    sound_play(sfx_collect, false, (1 << 0))
    ds_list_add(global.saveroom, id)
    instance_destroy()
}
