function sound_play(argument0, argument1, argument2, argument3) //sound_play
{
    if (argument1 == undefined)
        argument1 = false
    if (argument2 == undefined)
        argument2 = (0 << 0)
    if (argument3 == undefined)
        argument3 = false
    if (argument1 && audio_is_playing(argument0))
        return;
    switch argument2
    {
        case (0 << 0):
            var snd_id = audio_play_sound(argument0, 1, false)
            break
        case (1 << 0):
            snd_id = audio_play_sound_at(argument0, x, y, 0, 200, 900, 1, false, 1)
            break
        case (2 << 0):
            snd_id = audio_play_sound_on(obj_player.playeremitter, argument0, false, 1)
            break
    }

    if argument3
        audio_sound_pitch(snd_id, random_range(0.925, 1.075))
    audio_sound_gain(snd_id, 0.6, 0)
}

function music_play(argument0, argument1) //music_play
{
    if (argument1 == undefined)
        argument1 = false
    if argument1
    {
        global.music = audio_play_sound(argument0, 10, true, 0)
        audio_sound_gain(global.music, 0.55, 2500)
    }
    else
    {
        global.music = audio_play_sound(argument0, 10, true)
        audio_sound_gain(global.music, 0.55, 1)
    }
    return global.music;
}

