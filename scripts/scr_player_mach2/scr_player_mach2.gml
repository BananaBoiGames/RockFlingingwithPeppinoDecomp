function scr_player_mach2() //scr_player_mach2
{
    input_get()
    if (windingAnim < 200)
        windingAnim++
    hsp = xscale * movespeed
    machslideAnim = false
    move = keyLeft.held + keyRight.held
    var maxmovespeed = 10
    if underwater
        maxmovespeed = 7
    if (movespeed < maxmovespeed)
        movespeed = maxmovespeed
    if (movespeed > maxmovespeed)
        movespeed -= 0.1
    if grounded
    {
        if (machpunchAnim == 0)
        {
            if (sprite_index != spr_player_mach && sprite_index != spr_player_machhit)
                sprite_index = choose(spr_player_mach, spr_player_machhit)
        }
        if (machpunchAnim == 1)
        {
            if (punch == 0)
                sprite_index = spr_player_machpunch1
            if (punch == 1)
                sprite_index = spr_player_machpunch2
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_machpunch1)
            {
                punch = 1
                machpunchAnim = 0
            }
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_machpunch2)
            {
                punch = 0
                machpunchAnim = 0
            }
        }
    }
    else
    {
        if (sprite_index != spr_player_mach2jump && sprite_index != spr_player_secondjump1 && sprite_index != spr_player_secondjump2)
            sprite_index = spr_player_secondjump1
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_secondjump1)
            sprite_index = spr_player_secondjump2
    }
    if (!grounded)
    {
        if (move == (-xscale))
            movespeed = maxmovespeed
    }
    if (grounded && (!underwater) && (!(place_meeting(x, (y + 1), obj_onewaywatersolid))))
    {
        if (mach2 < 100)
            mach2 += 1.25
        if (mach2 >= 100)
        {
            state = states.mach3
            flash = 1
            if global.upgrade_mach4
                sprite_index = spr_player_mach4
            else
                sprite_index = spr_player_mach3
            instance_create(x, y, obj_jumpdust)
            instance_create(x, y, obj_mach3effect1)
            instance_create(x, y, obj_mach3effect2)
            movespeed = 10
        }
    }
    if keyJump.pressed
        input_buffer_jump = 0
    if ((!keyDash.held) && grounded)
    {
        sound_play(sfx_machEnd, false, (2 << 0))
        sprite_index = spr_player_machslidestart
        state = states.machslide
        image_index = 0
        mach2 = 35
    }
    if (move == -1 && xscale == 1 && grounded)
    {
        sound_play(sfx_slide, false, (1 << 0), true)
        sprite_index = spr_player_machslideboost
        state = states.machslide
        image_index = 0
        mach2 = 35
    }
    if (move == 1 && xscale == -1 && grounded)
    {
        sound_play(sfx_slide, false, (1 << 0), true)
        sprite_index = spr_player_machslideboost
        state = states.machslide
        image_index = 0
        mach2 = 35
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
        sound_play(sfx_slide, false, (1 << 0), true)
        state = states.crouchslide
    }
    if ((!keyJump.held) && jumpstop == 0 && vsp < 0.5 && stompAnim == false)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))) && keyDash.held)
    {
        sound_play(sfx_jump, false, (1 << 0))
        image_index = 0
        vsp = -9
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
            hsp = -2.5 * xscale
            vsp = -3
            mach2 = 0
            image_index = 0
            instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
            sound_play(sfx_bump, false, (1 << 0), true)
        }
        else if ((!grounded) && global.upgrade_climbwall)
            state = states.climbwall
    }
    if place_meeting(x, (y + 1), obj_onewaywatersolid)
    {
        mach2 = 50
        repeat (4)
            instance_create((x - xscale * 30), (y + 40), obj_waterdrop)
    }
    if (!(place_meeting(x, (y + 1), obj_collisionparent)))
        machpunchAnim = 0
    create_mach2effect(x, y, sprite_index, (image_index - 1))
    if ((!instance_exists(obj_dashcloud)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
        instance_create(x, y, obj_dashcloud)
    if (!underwater)
        image_speed = 0.65
    else
        image_speed = 0.35
    scr_dotaunt()
    perform_collisions()
}

