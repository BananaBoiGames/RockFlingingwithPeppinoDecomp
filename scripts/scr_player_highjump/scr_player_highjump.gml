function scr_player_highjump() //scr_player_highjump
{
    input_get()
    move = keyLeft.held + keyRight.held
    hsp = move * movespeed
    if (jumpAnim == true)
    {
        sprite_index = spr_player_Sjumpstart
        if (floor(image_index) == (image_number - 1))
            jumpAnim = false
    }
    if (jumpAnim == false)
        sprite_index = spr_player_Sjump
    if ((place_meeting((x + 1), y, obj_bumpable) && xscale == 1) || (place_meeting((x - 1), y, obj_bumpable) && xscale == -1))
        movespeed = 0
    if (move == 0)
        movespeed = 0
    if (move != 0 && ((movespeed < 5 && (!underwater)) || (movespeed < 3 && underwater)))
        movespeed += 0.5
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
    }
    landAnim = true
    if ((!keyJump.held) && jumpstop == 0 && vsp < 0)
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
    if (grounded && vsp > 0)
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
        sprite_index = spr_player_jump
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
    if (move != 0)
        xscale = move
    if underwater
        image_speed = 0.2
    else
        image_speed = 0.35
    perform_collisions()
}

