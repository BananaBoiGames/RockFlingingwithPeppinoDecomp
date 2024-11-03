if other.keyJump.pressed
{
    with (obj_player)
    {
        targetDoor = "A"
        targetRoom = other.targetRoom
        image_index = 0
        state = states.normal
    }
    instance_create(x, y, obj_fadeout)
}
with (obj_camera)
{
    text = other.levelmsg
    showtext = true
    alarm[2] = 5
}
