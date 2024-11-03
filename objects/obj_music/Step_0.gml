if global.panic
{
    if (music != 40)
    {
        music = 40
        audio_stop_sound(musicID)
        musicID = music_play(music)
    }
}
if (!global.panic)
{
    if instance_exists(obj_player)
    {
        switch obj_player.state
        {
            case states.bombpep:
                if (obj_player.sprite_index != spr_bombpep_end)
                    transfomusic = mu_bomb
                else
                    transfomusic = -4
                break
            case states.knightpep:
            case states.knightpepattack:
                transfomusic = mu_knight
                break
            default:
                transfomusic = -4
                break
        }

    }
    if (transfomusic != -4 && (!audio_is_playing(transfomusicID)))
    {
        if (string_pos("bonus", room_get_name(room)) != 0)
            audio_pause_sound(bonusmusicID)
        else
            audio_pause_sound(musicID)
        transfomusicID = music_play(transfomusic)
        audio_sound_gain(transfomusic, 0.55, 1)
    }
    else if (transfomusic == -4 && audio_is_playing(transfomusicID))
    {
        if (string_pos("bonus", room_get_name(room)) != 0)
            audio_resume_sound(bonusmusicID)
        else
            audio_resume_sound(musicID)
        audio_stop_sound(transfomusicID)
    }
}
if (string_pos("bonus", room_get_name(room)) == 0 && audio_is_playing(bonusmusic))
    audio_pause_sound(bonusmusic)
if (string_pos("bonus", room_get_name(room)) != 0 && audio_is_playing(bonusmusic) && transfomusic != -4)
    audio_pause_sound(bonusmusic)
