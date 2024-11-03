function scr_player_knightpep() //scr_player_knightpep
{
    input_get()
    if (sprite_index == spr_knightpep_walk || sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_jump || sprite_index == spr_knightpep_fall || sprite_index == spr_knightpep_land)
    {
        move = keyLeft.held + keyRight.held
        hsp = move * movespeed
    }
    else if grounded
    {
        hsp = 0
        move = 0
    }
    if keyJump.pressed
        input_buffer_jump = 0
    if ((!keyJump.held) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 2
        jumpstop = true
    }
    if (grounded && vsp > 0)
        jumpstop = false
    if ((sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_walk) && keySlap.held)
    {
        sound_play(sfx_swordswing, false, (2 << 0), false)
        instance_create(x, y, obj_swordhitbox)
        instance_create((x + (-xscale) * 10), y, obj_slidecloud)
        sprite_index = spr_knightpep_attack
        image_index = 0
        state = states.knightpepattack
    }
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if (grounded && move != 0 && sprite_index == spr_knightpep_idle)
        sprite_index = spr_knightpep_walk
    else if (grounded && move == 0 && sprite_index == spr_knightpep_walk)
        sprite_index = spr_knightpep_idle
    if (input_buffer_jump < 8 && vsp > 0 && grounded && (sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_walk))
    {
        sound_play(sfx_jump, false, (1 << 0))
        image_index = 0
        sprite_index = spr_knightpep_jumpstart
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_jumpstart)
    {
        vsp = -7
        if keyRight.held
            hsp = 4.5
        if (-keyLeft.held)
            hsp = -4.5
        sprite_index = spr_knightpep_jump
    }
    if ((floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_jump) || ((!grounded) && sprite_index != spr_knightpep_jump))
        sprite_index = spr_knightpep_fall
    if (sprite_index == spr_knightpep_fall && grounded)
    {
        sound_play(sfx_bumpBig, false, (1 << 0))
        with (obj_baddie)
        {
            if point_in_camera(x, y, view_camera[0])
            {
                vsp = -7
                hsp = 0
            }
        }
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = 30 / room_speed
        }
        freefallstart = 0
        image_index = 0
        sprite_index = spr_knightpep_land
        instance_create(x, y, obj_landcloud)
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_land)
        sprite_index = spr_knightpep_idle
    if (move != 0)
        xscale = move
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (movespeed == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (move != 0)
    {
        if (movespeed < 1)
            image_speed = 0.15
        else if (movespeed > 1 && movespeed < 4)
            image_speed = 0.35
        else
            image_speed = 0.6
    }
    else
        image_speed = 0.35
    if (grounded && hsp != 0)
        sound_play(sfx_land, true, (2 << 0), true)
    if (floor(image_index) == 9 && sprite_index == spr_knightpep_start)
        instance_create(x, (y - 600), obj_thunder)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_thunder)
        sprite_index = spr_knightpep_idle
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    perform_collisions()
}

