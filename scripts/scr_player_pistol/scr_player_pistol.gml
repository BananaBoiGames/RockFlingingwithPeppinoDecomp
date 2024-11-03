function scr_player_pistol() //scr_player_pistol
{
    input_get()
    mach2 = 0
    hsp = image_xscale * movespeed
    if (place_meeting(x, (y + 1), obj_collisionparent) && movespeed >= 0)
        movespeed -= 0.4
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    if (floor(image_index) == (image_number - 1))
        state = states.normal
    if (shoot == 1 && floor(image_index) == 0)
    {
        with (obj_camera)
        {
            shake_mag = 8
            shake_mag_acc = 30 / room_speed
        }
        with (instance_create(x, y, obj_pistoleffect))
            image_xscale = other.image_xscale
        if (image_xscale == 1)
            var box = bbox_right
        else
            box = bbox_left
        var ID = instance_create((box + image_xscale * 10), y, obj_pistolbullet)
        ID.hspeed = image_xscale * 20
        shoot = 0
    }
    if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
        instance_create(x, y, obj_slidecloud)
    if place_meeting(x, (y + 1), obj_collisionparent)
        sprite_index = spr_player_pistol
    else
        sprite_index = spr_player_pistolair
    image_speed = 0.35
    perform_collisions()
}

