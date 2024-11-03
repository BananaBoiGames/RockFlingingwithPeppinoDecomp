if global.lapping
{
    instance_create(x, y, obj_bigcollect)
    instance_create(x, y, obj_bigcollect)
    sound_play(sfx_bell, false, (1 << 0), true)
    global.lapping = false
    ds_list_add(global.saveroom, id)
    instance_destroy()
}
