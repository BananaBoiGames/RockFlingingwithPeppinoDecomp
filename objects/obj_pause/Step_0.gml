input_get()
image_speed = 0.35
if (keyStart.pressed && room != rm_init && room != rm_title)
{
    if (!pause)
    {
        pause = true
        collectSpr = obj_camera.collect_spr
        sound_play(sfx_pause)
        with (obj_music)
        {
            if audio_is_playing(music)
                audio_sound_gain(music, 0.3, 250)
            if audio_is_playing(bonusmusic)
                audio_sound_gain(bonusmusic, 0.3, 250)
            if (transfomusic != -4 && audio_is_playing(transfomusic))
                audio_sound_gain(transfomusic, 0.3, 250)
        }
        pause_image_create()
        instance_deactivate_all(true)
    }
    else
        pause_resume()
}
if pause
{
    menuX = lerp(menuX, menuInX, 0.1)
    menuY = lerp(menuY, menuInY, 0.1)
    bgX = lerp(bgX, 960, 0.1)
    bgAlpha = lerp(bgAlpha, 0.5, 0.1)
    collectAlpha = lerp(collectAlpha, 1, 0.25)
}
else
{
    menuX = lerp(menuX, menuOutX, 0.05)
    menuY = lerp(menuY, menuOutY, 0.05)
    bgX = lerp(bgX, (960 + sprite_get_width(spr_pauseBG)), 0.1)
    bgAlpha = lerp(bgAlpha, 0, 0.1)
    collectAlpha = lerp(collectAlpha, 0, 0.25)
}
if pause
{
    if (keyUp.pressed && selection > 0)
        selection--
    if (keyDown.pressed && selection < (array_length(pause_menu) - 1))
        selection++
    if keyJump.pressed
        self.pause_menu[selection][1]()
}
