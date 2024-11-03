with (obj_player)
{
    if (state == states.normal && keyUp.held && y == (other.y + 50))
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        other.visited = 1
        image_index = 0
        state = states.door
        ds_list_add(global.saveroom, id)
        sound_play(sfx_door, false, (1 << 0))
        instance_create(x, y, obj_fadeout)
    }
}
