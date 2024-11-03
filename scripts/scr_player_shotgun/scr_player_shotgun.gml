function scr_player_shotgun() //scr_player_shotgun
{
    input_get()
    mach2 = 0
    hsp = xscale * movespeed
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
            image_xscale = other.xscale
        if (xscale == 1)
            var box = bbox_right
        else
            box = bbox_left
        var ID = instance_create((box + xscale * 10), y, obj_shotgunbullet)
        ID.hspeed = xscale * 20
        ID.vspeed = -2
        ID.image_angle = xscale * 4
        var ID4 = instance_create((box + xscale * 10), y, obj_shotgunbullet)
        ID4.hspeed = xscale * 20
        ID4.vspeed = -1
        ID4.image_angle = xscale * 2
        var ID2 = instance_create((box + xscale * 10), y, obj_shotgunbullet)
        ID2.hspeed = xscale * 20
        var ID3 = instance_create((box + xscale * 10), y, obj_shotgunbullet)
        ID3.hspeed = xscale * 20
        ID3.image_angle = xscale * -4
        ID3.vspeed = 2
        var ID5 = instance_create((box + xscale * 10), y, obj_shotgunbullet)
        ID5.hspeed = xscale * 20
        ID5.image_angle = xscale * -2
        ID5.vspeed = 1
        shoot = 0
    }
    if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
        instance_create(x, y, obj_slidecloud)
    sprite_index = spr_player_shotgun
    image_speed = 0.35
    perform_collisions()
}

