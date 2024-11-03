global.collect += 100
instance_create(x, y, obj_100)
if audio_is_playing(sfx_collectBig)
    audio_stop_sound(sfx_collectBig)
sound_play(sfx_collectBig, false, (1 << 0))
ds_list_add(global.saveroom, id)
instance_destroy()
