if DEBUG
{
    with (obj_solid)
    {
        if (object_index == obj_solid)
            visible = other.showcollisions
    }
    with (obj_slope)
    {
        if (object_index == obj_slope)
            visible = other.showcollisions
    }
    with (obj_platform)
    {
        if (object_index == obj_platform)
            visible = other.showcollisions
    }
}
