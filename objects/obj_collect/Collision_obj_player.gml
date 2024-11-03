if (cantcollect == 0)
{
    global.collect += 10
    instance_create(x, y, obj_10)
    if audio_is_playing(sfx_collect)
        audio_stop_sound(sfx_collect)
    sound_play(sfx_collect, false, (1 << 0))
    with (obj_camera)
        collect_spr = other.sprite_index
    ds_list_add(global.saveroom, id)
    instance_destroy()
}
