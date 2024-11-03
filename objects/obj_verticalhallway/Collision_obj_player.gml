if (createdfadeout == 0)
{
    createdfadeout = 1
    instance_create(x, y, obj_fadeout)
}
with (obj_player)
{
    targetDoor = other.targetDoor
    targetRoom = other.targetRoom
    hallwaydirection = other.image_yscale
    verticalhallway = true
}
