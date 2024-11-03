function scr_player_runonball() //scr_player_runonball
{
    input_get()
    move = keyLeft.held + keyRight.held
    if (!keyDash.held)
        hsp = move * movespeed
    else
        hsp = image_xscale * movespeed
    jumpstop = 0
    vsp = obj_player.vsp
    if (!(place_meeting(x, (y + 1), obj_runonball)))
    {
        mach2 = 0
        state = states.normal
        jumpAnim = true
        jumpstop = 0
    }
    if (keyJump.pressed && place_meeting(x, (y + 1), obj_collisionparent) && (!keyDown.held) && (!keyDash.held))
    {
        sprite_index = spr_player_jump
        vsp = -7
        state = states.jump
        image_index = 0
        machslideAnim = false
        jumpAnim = true
        sound_play(sfx_jump, false, (1 << 0))
    }
    movespeed = 2.5
    sprite_index = spr_player_slipnslide
    if (keyDash.held && place_meeting(x, (y + 1), obj_collisionparent))
    {
        if (mach2 < 35)
        {
            mach2++
            movespeed = 4
        }
        if (mach2 >= 35)
            movespeed = 6
    }
    if (!keyDash.held)
        mach2 = 0
    image_speed = 0.35
    perform_collisions()
}

