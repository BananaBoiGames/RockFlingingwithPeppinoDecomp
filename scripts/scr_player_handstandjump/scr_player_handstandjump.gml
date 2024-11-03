function scr_player_handstandjump() //scr_player_handstandjump
{
    input_get()
    move = keyLeft.held + keyRight.held
    if (!grounded)
        hsp = move * movespeed
    else
        hsp = 0
    if (move == 0)
        movespeed = 0
    if (move != 0 && movespeed < 6)
        movespeed += 0.5
    if ((place_meeting((x + 1), y, obj_collisionparent) && move == 1) || (place_meeting((x - 1), y, obj_collisionparent) && move == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope)))))
        movespeed = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
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
    if (grounded && vsp > 0 && keyDash.held && momemtum == 1 && sprite_index == spr_player_fall2)
    {
        landAnim = false
        state = states.mach1
        jumpAnim = true
        jumpstop = 0
        image_index = 0
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
        sound_play(sfx_land, true, (1 << 0), true)
    }
    if (grounded && vsp > 0 && ((!keyDash.held) || momemtum == 0) && sprite_index == spr_player_fall2)
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
    if (grounded && input_buffer_jump < 8 && vsp > 0 && sprite_index == spr_player_fall2)
    {
        sprite_index = spr_player_jump
        stompAnim = false
        vsp = -10
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
    if (sprite_index == spr_player_handstandjump && image_index > 3 && image_index < 4 && grounded)
    {
        vsp = -12
        sound_play(sfx_jump, false, (1 << 0))
    }
    if (sprite_index == spr_player_handstandjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_fall2
    if (move != 0 && (!grounded))
        xscale = move
    image_speed = 0.35
    perform_collisions()
}

