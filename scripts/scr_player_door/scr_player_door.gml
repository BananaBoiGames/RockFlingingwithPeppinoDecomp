function scr_player_door() //scr_player_door
{
    input_get()
    hsp = 0
    mach2 = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    var nearest_door = instance_nearest(x, y, obj_door)
    if (nearest_door != noone)
    {
        x = approach(x, (nearest_door.x + nearest_door.sprite_width / 2), 2)
        y = approach(y, (nearest_door.y + nearest_door.sprite_height / 2), 2)
    }
    sprite_index = spr_player_lookdoor
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
}

