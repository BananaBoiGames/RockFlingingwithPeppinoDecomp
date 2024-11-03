function scr_player_grabbing() //scr_player_grabbing
{
    input_get()
    if (!instance_exists(baddiegrabbedID))
        state = states.normal
    move = keyLeft.held + keyRight.held
    hsp = move * movespeed
    if ((!keyJump.held) && jumpstop == 0 && vsp < 0.5 && stompAnim == false)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (((place_meeting((x + 1), y, obj_collisionparent) && xscale == 1) || (place_meeting((x - 1), y, obj_collisionparent) && xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
        movespeed = 0
    if (xscale == 1 && move == -1)
        movespeed = 0
    if (xscale == -1 && move == 1)
        movespeed = 0
    if (move == 0 && grounded)
    {
        movespeed = 0
        sprite_index = spr_player_grabbing
    }
    if (move != 0)
    {
        if place_meeting(x, (y + 1), obj_collisionparent)
            sprite_index = spr_player_grabbingmove
        xscale = move
    }
    if (keyJump.pressed && grounded && (!keyDown.held))
    {
        sound_play(sfx_jump, false, (2 << 0))
        vsp = -10
        image_index = 0
        sprite_index = spr_player_grabbingjump
    }
    if (sprite_index == spr_player_grabbingjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_grabbingfall
    if ((!grounded) && vsp > 0)
        sprite_index = spr_player_grabbingfall
    if keySlap.pressed
    {
        state = states.grabfinish
        image_index = 0
        image_speed = 0.35
        hsp = 0
        sprite_index = spr_player_punch
    }
    else if keyUp.pressed
    {
        state = states.grabfinish
        image_index = 0
        image_speed = 0.35
        if (move == xscale)
        {
            vsp = -8
            sprite_index = spr_player_upthrow
        }
        else
        {
            hsp = 0
            sprite_index = spr_player_uppunch
        }
    }
    else if (keyDown.pressed && (!grounded))
    {
        state = states.grabfinish
        image_index = 0
        image_speed = 0.35
        if (move == xscale)
        {
            vsp = -8
            sprite_index = spr_player_downthrow
        }
        else
        {
            hsp = 0
            sprite_index = spr_player_shoulder
        }
    }
    if (keyJump.pressed && (!grounded) && baddiegrabbedID.object_index != obj_rock)
    {
        sound_play(sfx_spin, false, (1 << 0))
        vsp = -11
        state = states.slam
        image_index = 0
        image_speed = 0.35
    }
    if (hsp != 0 && grounded)
        sound_play(sfx_step, true, (1 << 0), true)
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (movespeed == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (move != 0 && grounded)
    {
        if (movespeed < 3 && move != 0)
            image_speed = 0.35
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    else
        image_speed = 0.35
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (grounded && vsp > 1)
        instance_create(x, y, obj_landcloud)
    perform_collisions()
}

