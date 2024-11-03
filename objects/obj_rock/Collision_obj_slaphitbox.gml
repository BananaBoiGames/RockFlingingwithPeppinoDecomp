if (!slapped)
{
    sound_play(sfx_slap, false, (1 << 0), true)
    slapped = true
    instance_create((x + obj_player.xscale * 40), y, obj_punchdust)
    x = obj_player.x
    y = obj_player.y
    grabbed = true
    obj_player.baddiegrabbedID = id
    obj_player.movespeed = 0
    obj_player.state = states.grabbing
    instance_destroy(other.id)
}
