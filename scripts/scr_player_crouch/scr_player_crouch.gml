function scr_player_crouch() //scr_player_crouch
{
    input_get()
    var maxmovespeed = 4
    if underwater
        maxmovespeed = 2
    move = keyLeft.held + keyRight.held
    hsp = move * movespeed
    if ((place_meeting((x + 1), y, obj_bumpable) && xscale == 1) || (place_meeting((x - 1), y, obj_bumpable) && xscale == -1))
        movespeed = 0
    if (xscale == 1 && move == -1)
        movespeed = 0
    if (xscale == -1 && move == 1)
        movespeed = 0
    if ((!(place_meeting(x, (y + 1), obj_collisionparent))) && (!keyJump.pressed))
    {
        jumpAnim = false
        state = states.crouchjump
        movespeed = 4
        crouchAnim = true
        image_index = 0
    }
    if (keyJump.pressed && place_meeting(x, (y + 1), obj_collisionparent) && (!(place_meeting(x, (y - 16), obj_collisionparent))) && (!(place_meeting(x, (y - 32), obj_collisionparent))))
    {
        if underwater
            vsp = -8
        else
            vsp = -9.2
        state = states.crouchjump
        movespeed = 4
        image_index = 0
        crouchAnim = true
        jumpAnim = true
        sound_play(sfx_jump, false, (1 << 0))
    }
    if (grounded && (!keyDown.held) && (!(place_meeting(x, (y - 16), obj_collisionparent))) && (!(place_meeting(x, (y - 32), obj_collisionparent))) && (!keyJump.pressed))
    {
        state = states.normal
        movespeed = 0
        crouchAnim = true
        jumpAnim = true
        image_index = 0
    }
    if (movespeed < maxmovespeed)
        movespeed += 0.5
    else if (movespeed >= maxmovespeed)
        movespeed = maxmovespeed
    if (crouchAnim == false)
    {
        if (move == 0)
            sprite_index = spr_player_crouch
        if (move != 0)
            sprite_index = spr_player_crawl
    }
    if (crouchAnim == true)
    {
        sprite_index = spr_player_couchstart
        if (floor(image_index) == (image_number - 1))
            crouchAnim = false
    }
    if (move != 0)
    {
        xscale = move
        crouchAnim = false
    }
    if underwater
        image_speed = 0.35
    else
        image_speed = 0.6
    perform_collisions()
}

