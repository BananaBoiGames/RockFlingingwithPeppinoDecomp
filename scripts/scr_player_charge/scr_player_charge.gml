function scr_player_charge() //scr_player_charge
{
    input_get()
    var maxchargespd = 15
    move = keyLeft.held + keyRight.held
    hsp = xscale * movespeed
    mach2 = 35
    sprite_index = spr_player_charge
    if grounded
        image_speed = 0.5
    else
    {
        image_index = 0
        image_speed = 0
    }
    if (movespeed < maxchargespd)
        movespeed += 0.075
    if (movespeed > maxchargespd)
        movespeed -= 0.05
    if (place_meeting((x + sign(hsp)), y, obj_bumpable) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        state = states.bump
        hsp = -2.5 * xscale
        vsp = -5
        mach2 = 0
        image_index = 0
        instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    if (move == (-xscale) && grounded)
    {
        sound_play(sfx_slide, false, (1 << 0), true)
        sprite_index = spr_player_machslideboost
        state = states.machslide
        image_index = 0
        mach2 = 35
    }
    if ((!keySlap.held) && (!keyDash.held) && grounded)
    {
        sound_play(sfx_machEnd, false, (2 << 0))
        sprite_index = spr_player_machslidestart
        state = states.machslide
        image_index = 0
        mach2 = 35
    }
    if (floor(image_index) == (image_number - 1) && (!keySlap.held) && keyDash.held)
    {
        mach2 = 45
        state = states.mach2
        flash = 1
        instance_create(x, y, obj_jumpdust)
    }
    landAnim = false
    if keyJump.pressed
        input_buffer_jump = 0
    if ((!keyJump.held) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
        vsp = -9
    if (!instance_exists(obj_chargeeffect))
        instance_create(x, y, obj_chargeeffect)
    if ((!instance_exists(obj_dashcloud)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
        instance_create(x, y, obj_dashcloud)
    scr_dotaunt()
    perform_collisions()
}

