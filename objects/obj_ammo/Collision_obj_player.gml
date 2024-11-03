if (global.ammo < 9)
{
    global.ammo += 1
    sound_play(sfx_collect, false, (1 << 0))
    ds_list_add(global.saveroom, id)
    instance_destroy()
}
