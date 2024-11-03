if (hitbuffer > 0)
    hitbuffer--
else if (place_meeting(x, (y + 16), obj_player) && obj_player.vsp < 0)
{
    sound_play(sfx_enemyHit, false, (1 << 0))
    sound_play(sfx_land, false, (1 << 0))
    variable_global_set(toggle_variable, (!variable_global_get(toggle_variable)))
    obj_player.vsp = 0
    hitbuffer = 25
}
if variable_global_get(toggle_variable)
    sprite_index = spr_enemyblock
else
    sprite_index = spr_enemyblock_sleep
