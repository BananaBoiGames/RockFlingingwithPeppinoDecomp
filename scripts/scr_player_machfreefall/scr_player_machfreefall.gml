function scr_player_machfreefall() //scr_player_machfreefall
{
    input_get()
    if (mach2 == 0)
    {
        hsp = move * movespeed
        movespeed = 4
    }
    else
    {
        hsp = xscale * movespeed
        movespeed = 10
    }
    machslideAnim = false
    move = keyLeft.held + keyRight.held
    sprite_index = spr_player_machfreefall
    if (place_meeting((x + 1), y, obj_bumpable) && image_xscale == 1)
    {
        state = states.bump
        hsp = -2.5
        vsp = -2.5
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    else if (place_meeting((x - 1), y, obj_bumpable) && image_xscale == -1)
    {
        state = states.bump
        hsp = 2.5
        vsp = -2.5
        mach2 = 0
        image_index = 0
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    if (grounded && input_buffer_jump >= 8)
    {
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = 40 / room_speed
        }
        sprite_index = spr_player_freefallland
        state = states.freefallland
        jumpstop = 0
        image_index = 0
        with (instance_create(x, (y + 35), obj_bangeffect))
            image_xscale = obj_player.xscale
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
        sound_play(sfx_land, true, (1 << 0), true)
        with (obj_baddie)
        {
            if point_in_camera(x, y, view_camera[0])
            {
                image_index = 0
                state = enemystate.stun
                vsp = -7
                hsp = 0
                stunned = 200
            }
        }
    }
    if (grounded && input_buffer_jump < 8 && vsp > 0)
    {
        sprite_index = spr_player_handstandjump
        stompAnim = false
        hsp = 0
        state = states.handstandjump
        jumpAnim = true
        jumpstop = 0
        image_index = 0
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
    }
    if keyJump.pressed
        input_buffer_jump = 0
    image_speed = 0.5
    perform_collisions()
}

