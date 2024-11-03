function scr_player_shotgunjump() //scr_player_shotgunjump
{
    input_get()
    hsp = xscale * movespeed
    if ((place_meeting((x + 1), y, obj_bumpable) && xscale == 1) || (place_meeting((x - 1), y, obj_bumpable) && xscale == -1))
        movespeed = 0
    if (move == 0)
        movespeed = 0
    if (move != 0 && movespeed < 6)
        movespeed += 0.5
    if (xscale == 1 && move == -1)
        movespeed = 0
    if (xscale == -1 && move == 1)
        movespeed = 0
    landAnim = true
    if (ladderbuffer > 0)
        ladderbuffer--
    if (place_meeting(x, (y - 1), obj_collisionparent) && jumpstop == 0 && jumpAnim == true)
    {
        vsp = grav
        jumpstop = 1
    }
    if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0)
    {
        if keyDash.held
            landAnim = false
        state = states.normal
        jumpAnim = true
        jumpstop = 0
        image_index = 0
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
        sound_play(sfx_land, true, (1 << 0), true)
    }
    if (place_meeting(x, (y + 1), obj_collisionparent) && input_buffer_jump < 5 && (!keyDown.held) && vsp > 0)
    {
        sprite_index = spr_player_jump
        stompAnim = false
        vsp = -9
        state = states.jump
        jumpAnim = true
        jumpstop = 0
        image_index = 0
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
        sound_play(sfx_jump, false, (1 << 0))
    }
    if (shoot == 1 && floor(image_index) == 0)
    {
        with (obj_camera)
        {
            shake_mag = 8
            shake_mag_acc = 30 / room_speed
        }
        with (instance_create((x + xscale * 5), (y + 40), obj_shotgunjumpeffect))
            image_xscale = other.xscale
        var box = bbox_bottom
        var ID = instance_create((x + xscale * 5), y, obj_shotgunbullet)
        ID.hspeed = xscale * -2
        ID.vspeed = 20
        ID.sprite_index = spr_shotgunbulletdown
        ID.image_angle = xscale * -4
        var ID4 = instance_create((x + xscale * 5), y, obj_shotgunbullet)
        ID4.hspeed = xscale * -1
        ID4.vspeed = 20
        ID4.sprite_index = spr_shotgunbulletdown
        ID4.image_angle = xscale * -2
        var ID2 = instance_create((x + xscale * 5), y, obj_shotgunbullet)
        ID2.vspeed = 20
        ID2.sprite_index = spr_shotgunbulletdown
        var ID3 = instance_create((x + xscale * 5), y, obj_shotgunbullet)
        ID3.hspeed = xscale * 2
        ID3.vspeed = 20
        ID3.sprite_index = spr_shotgunbulletdown
        ID3.image_angle = xscale * 4
        var ID5 = instance_create((x + xscale * 5), y, obj_shotgunbullet)
        ID5.hspeed = xscale * 1
        ID5.vspeed = 20
        ID5.image_angle = xscale * 2
        ID5.sprite_index = spr_shotgunbulletdown
        shoot = 0
    }
    if keyJump.pressed
        input_buffer_jump = 0
    if (sprite_index == spr_player_shotgunjump1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_shotgunjump2
    if (move != 0)
        xscale = move
    image_speed = 0.35
    perform_collisions()
}

