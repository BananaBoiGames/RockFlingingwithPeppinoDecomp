if (other.keyJump.pressed && other.state != states.menu && (!instance_exists(obj_shop)))
{
    with (other)
        state = states.menu
    instance_create(x, y, obj_shop)
}
