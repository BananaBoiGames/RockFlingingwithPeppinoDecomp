if (other.image_index == 0 && state == states.normal)
{
    sound_play(sfx_swordswing, false, (1 << 0), false)
    other.image_index = 1
    image_index = 0
    sprite_index = spr_knightpep_start
    state = states.knightpep
    hsp = 0
}
