function pause_resume() //pause_resume
{
    pause = false
    selection = 0
    pause_image_delete()
    instance_activate_all()
    with (obj_music)
    {
        if audio_is_playing(music)
            audio_sound_gain(music, 0.55, 250)
        if audio_is_playing(bonusmusic)
            audio_sound_gain(bonusmusic, 0.55, 250)
        if (transfomusic != -4 && audio_is_playing(transfomusic))
            audio_sound_gain(transfomusic, 0.55, 250)
    }
}

function pause_restart() //pause_restart
{
    game_restart()
}

function pause_exit() //pause_exit
{
    game_end()
}

function pause_image_create() //pause_image_create
{
    draw_set_alpha(1)
    screensprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0)
}

function pause_image_draw() //pause_image_draw
{
    if pause
        draw_sprite(screensprite, 0, 0, 0)
}

function pause_image_delete() //pause_image_delete
{
    if sprite_exists(screensprite)
        sprite_delete(screensprite)
}

