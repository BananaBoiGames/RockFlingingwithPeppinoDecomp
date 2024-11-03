with (obj_player)
{
    if (state == states.normal && keyUp.held && y == (other.y + 50))
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        other.visited = 1
        image_index = 0
        state = states.door
        global.collect = 0
        global.secretsfound = 0
        global.cheesefollow = false
        global.shroomfollow = false
        global.pineapplefollow = false
        global.tomatofollow = false
        global.sausagefollow = false
        global.key_inv = false
        global.keyget = false
        ds_list_clear(global.collectlist)
        ds_list_clear(global.saveroom)
        ds_list_clear(global.baddieroom)
        sound_play(sfx_door, false, (1 << 0))
        instance_create(x, y, obj_fadeout)
    }
}
