function scr_player_current() //scr_player_current
{
    input_get()
    landAnim = true
    if place_meeting(x, y, obj_current)
    {
        mach2 = 35
        hsp = -15
        movespeed = 5
    }
    if place_meeting(x, y, obj_current2)
    {
        mach2 = 35
        hsp = 15
        movespeed = 5
    }
    if ((!(place_meeting(x, y, obj_current))) && (!(place_meeting(x, y, obj_current2))))
    {
        mach2 = 0
        hsp = xscale * movespeed
        if (movespeed > 0)
            movespeed -= 0.2
        if (movespeed == 0)
        {
            state = states.normal
            movespeed = 0
            mach2 = 0
            image_index = 0
        }
        if place_meeting((x + xscale), y, obj_collisionparent)
        {
            state = states.bump
            hsp = -2 * xscale
            vsp = -3
            mach2 = 0
            image_index = 0
            instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
            sound_play(sfx_bump, true, (1 << 0))
        }
    }
    else if keyJump.held
    {
        if (vsp > -4)
            vsp--
        if ((!(place_meeting(x, (y - 15), obj_current))) && (!(place_meeting(x, (y - 15), obj_current2))))
            vsp = -10
    }
    sprite_index = spr_player_slipnslide
    image_speed = 0.35
    perform_collisions()
}

