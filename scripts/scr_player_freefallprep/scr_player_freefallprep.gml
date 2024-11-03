function scr_player_freefallprep() //scr_player_freefallprep
{
    input_get()
    move = keyLeft.held + keyRight.held
    hsp = xscale * movespeed
    if place_meeting((x + xscale), y, obj_solid)
        movespeed = 0
    if (move != 0 && movespeed < 6)
        movespeed += 0.5
    if (move != 0 && move == (-xscale))
        movespeed = 2
    if (move != 0)
        xscale = move
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    if (place_meeting((x + sign(hsp)), y, obj_bumpable) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        state = states.bump
        hsp = -2.5 * xscale
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    sprite_index = spr_player_bodyslamstart
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
    else
        image_speed = 0.35
    if grounded
    {
        sound_play(sfx_slide, false, (1 << 0), true)
        state = states.crouchslide
    }
    if (!keyDown.held)
        state = states.freefall
    perform_collisions()
}

