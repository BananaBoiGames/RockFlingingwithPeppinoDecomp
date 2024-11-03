if (other.image_index == 0)
{
    instance_create(x, y, obj_bangeffect)
    sound_play(sfx_hurt, false, (0 << 0))
    sound_play(sfx_breakblock, false, (0 << 0), true)
    sound_play(sfx_slap, false, (0 << 0), false)
    sprite_index = spr_player_machfreefall
    drop = 1
    vsp = -20
    hsp = 8
    other.image_index = 1
}
