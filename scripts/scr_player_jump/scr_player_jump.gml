function scr_player_jump() //scr_player_jump
{
    input_get()
    var maxmovespeed = 6
    if underwater
        maxmovespeed = 3
    move = keyLeft.held + keyRight.held
    if (momemtum == 0)
        hsp = move * movespeed
    else
        hsp = xscale * movespeed
    if (move == 0 && momemtum == 0)
        movespeed = 0
    if (move != 0 && movespeed < maxmovespeed)
        movespeed += 0.5
    if ((place_meeting((x + 1), y, obj_collisionparent) && move == 1) || (place_meeting((x - 1), y, obj_collisionparent) && move == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope)))))
        movespeed = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if (move == (-xscale))
    {
        movespeed = 0
        momemtum = 0
    }
    if (keyDown.pressed && (!underwater))
    {
        if global.upgrade_bodyslam
        {
            image_index = 0
            state = states.freefallprep
            vsp = -9
        }
        else
        {
            if (vsp < 0.5)
                vsp /= 2
            state = states.facestomp
        }
    }
    landAnim = true
    if ((!keyJump.held) && jumpstop == 0 && vsp < 0.5 && stompAnim == false)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (ladderbuffer > 0)
        ladderbuffer--
    if (place_meeting(x, (y - 1), obj_collisionparent) && jumpstop == 0 && jumpAnim == true)
    {
        vsp = grav
        jumpstop = 1
    }
    if (grounded && vsp > 0 && keyDash.held)
    {
        mach2 = 0
        sprite_index = spr_player_mach1
        jumpAnim = true
        jumpstop = 0
        state = states.mach1
        image_index = 0
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
        sound_play(sfx_land, true, (1 << 0), true)
    }
    if (grounded && vsp > 0 && (!keyDash.held))
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
    if (grounded && input_buffer_jump < 8 && (!keyDown.held) && vsp > 0)
    {
        if (move != 0)
            sprite_index = spr_player_jump2
        else
            sprite_index = spr_player_jump
        stompAnim = false
        if (!underwater)
            vsp = -10
        else
            vsp = -8.5
        state = states.jump
        jumpAnim = true
        jumpstop = 0
        image_index = 0
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
        sound_play(sfx_jump, false, (1 << 0))
    }
    if keyJump.pressed
        input_buffer_jump = 0
    if (stompAnim == false)
    {
        if (jumpAnim == true)
        {
            if (floor(image_index) == (image_number - 1))
                jumpAnim = false
        }
        if (jumpAnim == false)
        {
            if (sprite_index == spr_player_airdash1)
                sprite_index = spr_player_airdash2
            if (sprite_index == spr_player_jump)
                sprite_index = spr_player_fall
            if (sprite_index == spr_player_jump2)
                sprite_index = spr_player_fall2
        }
    }
    if (stompAnim == true)
    {
        if (sprite_index == spr_player_stompprep && floor(image_index) == (image_number - 1))
            sprite_index = spr_player_stomp
    }
    if (move != 0)
        xscale = move
    if underwater
        image_speed = 0.2
    else
        image_speed = 0.35
    if (keySlap.pressed && (!suplexmove))
    {
        sound_play(sfx_suplexdash, false, (2 << 0))
        suplexmove = true
        sprite_index = spr_player_suplexdash
        image_index = 0
        state = states.suplexdash
    }
    scr_dotaunt()
    perform_collisions()
}

