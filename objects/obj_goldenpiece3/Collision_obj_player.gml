global.collect += 500
global.goldenpiece3 = true
if audio_is_playing(sfx_collectGoldenPizza)
    audio_stop_sound(sfx_collectGoldenPizza)
sound_play(sfx_collectGoldenPizza, false, (1 << 0))
ds_list_add(global.saveroom, id)
instance_destroy()
