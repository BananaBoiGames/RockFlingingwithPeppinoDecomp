function scr_player_keyget() //scr_player_keyget
{
    input_get()
    hsp = 0
    if (image_index == 0)
    {
        audio_pause_all()
        with (obj_music)
            audio_stop_sound(bonusmusicID)
    }
    image_speed = 0.35
    movespeed = 0
    mach2 = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    sound_play(sfx_key, true)
    sprite_index = spr_player_keyget
    if (floor(image_index) == (image_number - 1))
    {
        audio_resume_all()
        with (obj_music)
        {
            if (string_pos("bonus", room_get_name(room)) == 0)
                audio_pause_sound(bonusmusic)
        }
        state = states.normal
        image_index = 0
    }
    perform_collisions()
}

