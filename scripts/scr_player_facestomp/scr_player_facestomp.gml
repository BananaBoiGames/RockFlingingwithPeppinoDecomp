function scr_player_facestomp() //scr_player_facestomp
{
    input_get()
    move = keyLeft.held + keyRight.held
    jumpAnim = false
    hsp = move * movespeed
    if (sprite_index != spr_player_facestomphit)
        sprite_index = spr_player_facestomp
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_facestomphit)
        sprite_index = spr_player_facestomp
    if ((place_meeting((x + 1), y, obj_bumpable) && xscale == 1) || (place_meeting((x - 1), y, obj_bumpable) && xscale == -1))
        movespeed = 0
    if (move == 0)
        movespeed = 0
    if (move != 0 && movespeed < 6)
        movespeed += 0.5
    if (xscale == 1 && move == -1)
        movespeed = 0
    if (xscale == -1 && move == 1)
        movespeed = 0
    landAnim = true
    if (vsp > 0)
        superslam++
    else
        superslam = 0
    if (vsp > 15)
    {
        state = states.freefall
        superslam = 0
    }
    if (grounded && (!(place_meeting(x, (y + 1), obj_destructibles))) && vsp > 0)
    {
        sound_play(sfx_bumpBig, false, (1 << 0), true)
        sprite_index = spr_player_freefallland
        state = states.freefallland
        jumpAnim = true
        jumpstop = 0
        image_index = 0
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
        sound_play(sfx_land, true, (1 << 0), true)
    }
    if (move != 0)
        xscale = move
    image_speed = 0.35
    if (grounded && input_buffer_jump < 8 && vsp > 0)
    {
        sprite_index = spr_player_handstandjump
        stompAnim = false
        hsp = 0
        state = states.handstandjump
        jumpAnim = true
        jumpstop = 0
        image_index = 0
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
    }
    if keyJump.pressed
        input_buffer_jump = 0
    perform_collisions()
}

