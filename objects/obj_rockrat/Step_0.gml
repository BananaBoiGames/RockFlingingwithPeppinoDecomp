with (instance_place((x - 1), y, obj_rock))
{
    if (!grabbed)
    {
        instance_destroy(other)
        instance_destroy()
    }
}
with (instance_place((x + 1), y, obj_rock))
{
    if (!grabbed)
    {
        instance_destroy(other)
        instance_destroy()
    }
}
with (instance_place(x, (y + 1), obj_rock))
{
    if (!grabbed)
    {
        instance_destroy(other)
        instance_destroy()
    }
}
with (instance_place(x, (y - 1), obj_rock))
{
    if (!grabbed)
    {
        instance_destroy(other)
        instance_destroy()
    }
}
with (instance_place(x, y, obj_rock))
{
    if (!grabbed)
    {
        instance_destroy(other)
        instance_destroy()
    }
}
