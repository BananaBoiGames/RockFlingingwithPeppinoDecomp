if global.panic
{
    global.lapping = 1
    sound_play(sfx_bell, false, (1 << 0), true)
    sound_play(sfx_confirm, false, (1 << 0), false)
    with (obj_camera)
    {
        text = "GET BACK TO THE TREASURE ROOM FOR 200 POINTS!!"
        showtext = true
        alarm[2] = 140
    }
    ds_list_add(global.saveroom, id)
    instance_destroy()
}
