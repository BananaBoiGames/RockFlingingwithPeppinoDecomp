function scr_player_mach1() //scr_player_mach1
{
    input_get()
    move = keyLeft.held + keyRight.held
    landAnim = false
    if (place_meeting((x + 1), y, obj_collisionparent) && xscale == 1 && (!(place_meeting((x + 1), y, obj_slope))))
    {
        mach2 = 0
        state = states.normal
        movespeed = 0
    }
    if (place_meeting((x - 1), y, obj_collisionparent) && xscale == -1 && (!(place_meeting((x - 1), y, obj_slope))))
    {
        mach2 = 0
        state = states.normal
        movespeed = 0
    }
    var maxmovespeed = 8
    var accel = 0.25
    if underwater
    {
        maxmovespeed = 5
        accel = 0.1
    }
    if (movespeed <= maxmovespeed)
        movespeed += accel
    hsp = floor(xscale * movespeed)
    if (place_meeting(x, (y + 1), obj_collisionparent) && xscale == 1 && move == -1)
    {
        audio_stop_sound(sfx_mach1)
        momemtum = 0
        mach2 = 0
        movespeed = 0
        image_index = 0
        xscale = -1
    }
    if (place_meeting(x, (y + 1), obj_collisionparent) && xscale == -1 && move == 1)
    {
        audio_stop_sound(sfx_mach1)
        momemtum = 0
        mach2 = 0
        movespeed = 0
        image_index = 0
        xscale = 1
    }
    if place_meeting(x, (y + 1), obj_collisionparent)
    {
        if (mach2 < 35)
            mach2++
        if (mach2 >= 35)
        {
            state = states.mach2
            instance_create(x, y, obj_jumpdust)
        }
    }
    sprite_index = spr_player_mach1
    if (!grounded)
    {
        sprite_index = spr_player_airdash1
        momemtum = 1
        state = states.jump
        jumpAnim = false
        image_index = 0
    }
    if (keyJump.pressed && grounded && keyDash.held)
    {
        sound_play(sfx_jump, false, (1 << 0))
        sprite_index = spr_player_airdash1
        dir = xscale
        momemtum = 1
        if (!underwater)
            vsp = -10
        else
            vsp = -8.5
        state = states.jump
        jumpAnim = true
        image_index = 0
    }
    if ((!keyDash.held) && grounded)
    {
        state = states.normal
        image_index = 0
        mach2 = 0
        machslideAnim = false
    }
    if (keySlap.pressed && grounded && global.upgrade_charge)
    {
        state = states.charge
        flash = true
        sound_play(sfx_chargestart, false, (2 << 0))
        if (movespeed < 8)
            movespeed = 8
        image_index = 0
    }
    if keyDown.held
    {
        sound_play(sfx_slide, false, (1 << 0), true)
        state = states.crouchslide
        mach2 = 0
    }
    if underwater
        image_speed = 0.25
    else
        image_speed = 0.45
    if ((!instance_exists(obj_dashcloud)) && grounded)
        instance_create(x, y, obj_dashcloud)
    scr_dotaunt()
    perform_collisions()
}

