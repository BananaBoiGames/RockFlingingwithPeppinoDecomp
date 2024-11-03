function scr_player_superslam() //scr_player_superslam
{
    input_get()
    if global.upgrade_bodyslam
    {
        move = keyLeft.held + keyRight.held
        hsp = move * movespeed
        if place_meeting((x + xscale), y, obj_solid)
            movespeed = 0
        if (move == 0)
            movespeed = 0
        if (move != 0 && movespeed < 6)
            movespeed += 0.5
        if (movespeed > 6)
            movespeed -= 0.5
        if (move != 0 && move == (-xscale))
            movespeed = 2
        if (move != 0)
            xscale = move
        sprite_index = spr_player_bodyslamfall
        if (vsp < 30)
            vsp++
    }
    else
    {
        movespeed = 0
        hsp = 0
        sprite_index = spr_player_freefall
    }
    if (grounded && (!(place_meeting(x, (y + 5), obj_destructibles))) && (input_buffer_jump >= 8 || global.upgrade_bodyslam))
    {
        sound_play(sfx_bumpBig, false, (1 << 0), true)
        if global.upgrade_bodyslam
            sprite_index = spr_player_bodyslamland
        else
            sprite_index = spr_player_freefallland
        state = states.freefallland
        jumpAnim = true
        jumpstop = 0
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
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = 40 / room_speed
        }
        image_index = 0
        with (instance_create(x, (y + 35), obj_bangeffect))
            image_xscale = obj_player.xscale
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
    }
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    if (!instance_exists(obj_superslameffect))
        instance_create(x, y, obj_superslameffect)
    if (grounded && input_buffer_jump < 8 && vsp > 0 && (!global.upgrade_bodyslam))
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
    image_speed = 0.35
    perform_collisions()
}

