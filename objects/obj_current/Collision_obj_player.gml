if (obj_player.state != states.hurt && obj_player.state != (28 << 0))
{
    obj_player.state = states.current
    obj_player.xscale = -1
    obj_player.barrel = false
}
