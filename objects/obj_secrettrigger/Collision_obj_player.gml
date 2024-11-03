instance_destroy()
ds_list_add(global.saveroom, id)
with (obj_camera)
{
    text = "YOU HAVE FOUND A SECRET!!"
    showtext = true
    alarm[2] = 140
}
sound_play(sfx_secretFound)
global.secretsfound++
