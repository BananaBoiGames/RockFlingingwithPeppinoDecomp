with (obj_player)
{
    if (state != states.Sjump && state != states.knightpep && state != states.knightpepattack)
    {
        x = other.x
        sound_play(sfx_plane, false, (2 << 0))
        state = states.Sjump
        sprite_index = spr_player_springjump
        vsp = -10
        other.image_index = 0
        other.image_speed = 0.35
    }
}
