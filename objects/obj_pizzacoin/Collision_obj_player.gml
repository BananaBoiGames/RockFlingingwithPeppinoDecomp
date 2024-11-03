global.pizzacoins += 20
instance_create(x, y, obj_20)
if audio_is_playing(sfx_pizzacoin)
    audio_stop_sound(sfx_pizzacoin)
sound_play(sfx_pizzacoin, false, (1 << 0))
with (obj_camera)
    pizzacoin_timer = pizzacoin_timermax
ds_list_add(global.saveroom, id)
instance_destroy()
