function scr_playersounds() //scr_playersounds
{
    if (state == states.mach1)
        sound_play(sfx_mach1, true, (2 << 0))
    else if (state != states.mach1 && audio_is_playing(sfx_mach1))
        audio_stop_sound(sfx_mach1)
    if (state == states.mach2 || state == states.climbwall)
    {
        if (state == states.climbwall)
            sound_play(sfx_mach2, true, (2 << 0))
        if (state == states.mach2)
        {
            if grounded
                sound_play(sfx_mach2, true, (2 << 0))
            else
            {
                if audio_is_playing(sfx_mach2)
                    audio_stop_sound(sfx_mach2)
                if (sprite_index == spr_player_mach2jump)
                    sound_play(sfx_spin, true, (2 << 0))
            }
        }
    }
    else if (state != states.mach2 && state != states.climbwall && audio_is_playing(sfx_mach2))
        audio_stop_sound(sfx_mach2)
    if (state == states.mach3)
        sound_play(sfx_mach3, true, (2 << 0))
    else if (state != states.mach3 && audio_is_playing(sfx_mach3))
        audio_stop_sound(sfx_mach3)
    if (state == states.machroll)
        sound_play(sfx_machroll, true, (2 << 0))
    else if (state != states.machroll && audio_is_playing(sfx_machroll))
        audio_stop_sound(sfx_machroll)
    if (state == states.machfreefall || state == states.chainsaw)
        sound_play(sfx_mach, true, (2 << 0))
    else if (state == states.bombpep)
    {
        if (grounded && hsp != 0)
            sound_play(sfx_mach, true, (2 << 0))
        else if audio_is_playing(sfx_mach)
            audio_stop_sound(sfx_mach)
    }
    else if (state != states.machfreefall && state != states.bombpep && state != states.chainsaw && audio_is_playing(sfx_mach))
        audio_stop_sound(sfx_mach)
    if (state == states.charge)
        sound_play(sfx_charge, true, (2 << 0))
    else if (state != states.charge && audio_is_playing(sfx_charge))
        audio_stop_sound(sfx_charge)
    if (state != states.charge && audio_is_playing(sfx_chargestart))
        audio_stop_sound(sfx_chargestart)
    if (state != states.Sjump && audio_is_playing(sfx_plane))
        audio_stop_sound(sfx_plane)
    if (state != states.suplexdash && audio_is_playing(sfx_suplexdash))
        audio_stop_sound(sfx_suplexdash)
    if (((state != states.normal && state != states.grabbing) || ((state == states.normal || state == states.grabbing) && (hsp == 0 || (!grounded)))) && audio_is_playing(sfx_step))
        audio_stop_sound(sfx_step)
}

