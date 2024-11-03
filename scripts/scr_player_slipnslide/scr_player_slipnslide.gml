function scr_player_slipnslide() //scr_player_slipnslide
{
    input_get()
    mach2 = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = false
    hsp = xscale * movespeed
    if (movespeed >= 0)
        movespeed -= 0.2
    if (floor(hsp) == 0)
    {
        state = states.normal
        movespeed = 0
        mach2 = 0
        image_index = 0
    }
    if (place_meeting((x + 1), y, obj_bumpable) && xscale == 1)
    {
        state = states.bump
        hsp = -2
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    if (place_meeting((x - 1), y, obj_bumpable) && xscale == -1)
    {
        state = states.bump
        hsp = 2
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    sprite_index = spr_player_slipnslide
    image_speed = 0.35
    sound_play(sfx_slide, true, (1 << 0), true)
    if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 1.5)
        instance_create(x, y, obj_slidecloud)
    perform_collisions()
}

