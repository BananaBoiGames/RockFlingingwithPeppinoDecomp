function scr_player_timesup() //scr_player_timesup
{
    input_get()
    if place_meeting(x, y, obj_timesup)
    {
        sound_play(sfx_punch)
        sound_play(sfx_bumpBig)
        state = states.gameover
        alarm[10] = 5
        vsp = -8
        hsp = -4
    }
    xscale = 1
    sprite_index = spr_player_timesup
    if (room == rm_result_timesup)
    {
        obj_player.x = 480
        obj_player.y = 270
    }
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
}

