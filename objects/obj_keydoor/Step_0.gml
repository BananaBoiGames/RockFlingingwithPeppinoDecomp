if (obj_player.state == states.normal && obj_player.keyUp.held && global.key_inv == 1 && place_meeting(x, y, obj_player))
{
    sound_play(sfx_land, false, (1 << 0))
    obj_player.state = states.victory
    obj_player.image_index = 0
    image_index = 0
    sprite_index = spr_doorkeyopen
    image_speed = 0.35
    instance_create((x + 50), (y + 50), obj_lock)
    ds_list_add(global.saveroom, id)
    global.key_inv = 0
    global.keyget = 0
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_doorkeyopen)
    image_speed = 0
if (floor(obj_player.image_index) == (obj_player.image_number - 1) && obj_player.state == states.victory)
{
    with (obj_player)
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout)
        instance_destroy(other.id)
    }
}
if place_meeting(x, y, obj_doorA)
    targetDoor = "A"
if place_meeting(x, y, obj_doorB)
    targetDoor = "B"
if place_meeting(x, y, obj_doorC)
    targetDoor = "C"
if place_meeting(x, y, obj_doorD)
    targetDoor = "D"
if place_meeting(x, y, obj_doorE)
    targetDoor = "E"
if place_meeting(x, y, obj_doorF)
    targetDoor = "F"
