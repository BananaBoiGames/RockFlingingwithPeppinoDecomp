if (!global.panic)
{
    var i = 0
    while (i < array_length(room_arr))
    {
        var b = room_arr[i]
        if (room == b[0])
        {
            var prevmusic = music
            music = b[1]
            if (music != prevmusic)
            {
                var prevmuID = musicID
                if (prevmuID == -4)
                    musicID = music_play(music)
                else
                    musicID = music_play(music, true)
                audio_sound_gain(music, 0.55, 1)
                if b[2]
                    audio_sound_set_track_position(musicID, audio_sound_get_track_position(prevmuID))
                fadedmusicID = prevmuID
                if (fadedmusicID != -4)
                {
                    audio_sound_gain(fadedmusicID, 0, 2500)
                    alarm[0] = 200
                }
            }
            audio_stop_sound(bonusmusicID)
            bonusmusicID = -4
            break
        }
        else
            i++
    }
}
if (string_pos("bonus", room_get_name(room)) != 0 && (!global.panic))
{
    bonusmusicID = music_play(bonusmusic)
    audio_sound_gain(bonusmusic, 0.55, 1)
    audio_sound_set_track_position(bonusmusicID, audio_sound_get_track_position(musicID))
    audio_pause_sound(musicID)
}
else if (string_pos("treasure", room_get_name(room)) != 0 && (!global.panic))
    audio_pause_sound(musicID)
else if (transfomusic == -4)
{
    audio_resume_sound(musicID)
    audio_pause_sound(bonusmusicID)
}
if (room == rm_result_rank)
{
    audio_stop_sound(musicID)
    audio_stop_sound(bonusmusicID)
    musicID = -4
    bonusmusicID = -4
}
