function scr_player_mach3() //scr_player_mach3
{
    input_get()
    if (windingAnim < 200)
        windingAnim++
    var maxmovespeed = 13
    if underwater
        maxmovespeed = 10
    hsp = xscale * movespeed
    mach2 = 100
    machslideAnim = false
    move = keyLeft.held + keyRight.held
    if global.upgrade_mach4
        movespeed = maxmovespeed
    else
    {
        if (movespeed < maxmovespeed)
            movespeed += 0.1
        if (movespeed > maxmovespeed)
            movespeed -= 0.1
    }
    if ((grounded || (sprite_index == spr_player_mach4jump && floor(image_index) == (image_number - 1))) && global.upgrade_mach4)
        sprite_index = spr_player_mach4
    if (!global.upgrade_mach4)
        sprite_index = spr_player_mach3
    if (input_buffer_jump < 8 && grounded && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))) && keyDash.held)
    {
        if global.upgrade_mach4
        {
            sprite_index = spr_player_mach4jump
            image_index = 0
        }
        sound_play(sfx_jump, false, (1 << 0))
        vsp = -9
    }
    if ((!keyJump.held) && jumpstop == 0 && vsp < 0.5 && stompAnim == false)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if keyJump.pressed
        input_buffer_jump = 0
    if (keyUp.held && global.upgrade_sjump)
    {
        sound_play(sfx_supermove, false, (1 << 0), true)
        vsp = -4
        sprite_index = spr_player_superjumpprep
        instance_create(x, y, obj_machsuperjump1)
        instance_create(x, y, obj_machsuperjump2)
        state = states.Sjumpprep
        hsp = 0
        image_index = 0
        flash = 1
    }
    if ((!keyDash.held) && grounded)
    {
        sound_play(sfx_machEnd, false, (2 << 0))
        flash = 0
        sprite_index = spr_player_machslidestart
        state = states.machslide
        image_index = 0
    }
    if (move == (-xscale) && grounded)
    {
        sound_play(sfx_slide, false, (1 << 0), true)
        if global.upgrade_mach4
            sprite_index = spr_player_machslideboost3
        else
            sprite_index = spr_player_machslideboost
        flash = 0
        state = states.machslide
        image_index = 0
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
    if (keyDown.held && grounded)
    {
        instance_create(x, y, obj_jumpdust)
        flash = 0
        state = states.machroll
    }
    if (keyDown.pressed && (!underwater) && (!grounded) && global.upgrade_bodyslam)
    {
        image_index = 0
        state = states.freefallprep
        vsp = -9
    }
    if (place_meeting((x + sign(hsp)), y, obj_bumpable) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        if (grounded || (!global.upgrade_climbwall))
        {
            state = states.bump
            sound_play(sfx_bump, false, (1 << 0), true)
            sound_play(sfx_bumpBig, false, (1 << 0), true)
            with (obj_camera)
            {
                shake_mag = 20
                shake_mag_acc = 40 / room_speed
            }
            hsp = 0
            image_speed = 0.35
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
            flash = 0
            hsp = -2.5 * xscale
            vsp = -3
            mach2 = 0
            image_index = 0
            instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
        }
        else if ((!grounded) && global.upgrade_climbwall)
            state = states.climbwall
    }
    if place_meeting(x, (y + 1), obj_onewaywatersolid)
    {
        mach2 = 50
        state = states.mach2
        flash = 1
        repeat (4)
            instance_create((x - xscale * 30), (y + 40), obj_waterdrop)
    }
    if ((!instance_exists(obj_chargeeffect)) && global.upgrade_mach4)
        instance_create(x, y, obj_chargeeffect)
    if ((!instance_exists(obj_dashcloud)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
        instance_create(x, y, obj_dashcloud)
    if (!underwater)
        image_speed = 0.4
    else
        image_speed = 0.25
    scr_dotaunt()
    perform_collisions()
}

