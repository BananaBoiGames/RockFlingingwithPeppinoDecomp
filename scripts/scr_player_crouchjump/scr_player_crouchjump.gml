function scr_player_crouchjump() //scr_player_crouchjump
{
    input_get()
    var maxmovespeed = 4
    if underwater
        maxmovespeed = 2
    move = keyLeft.held + keyRight.held
    hsp = move * movespeed
    if (xscale == 1 && move == -1)
        movespeed = 0
    if (xscale == -1 && move == 1)
        movespeed = 0
    if (movespeed < maxmovespeed)
        movespeed += 0.5
    else if (movespeed >= maxmovespeed)
        movespeed = maxmovespeed
    if ((!keyJump.held) && jumpstop == 0 && jumpAnim == true)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (place_meeting(x, (y - 1), obj_collisionparent) && jumpstop == 0 && jumpAnim == true)
    {
        vsp = grav
        jumpstop = 1
    }
    if (grounded && keyDown.held)
    {
        state = states.crouch
        jumpAnim = true
        crouchAnim = true
        image_index = 0
        jumpstop = 0
        instance_create(x, y, obj_landcloud)
        sound_play(sfx_land, true, (1 << 0), true)
    }
    if (grounded && (!keyDown.held) && (!(place_meeting(x, (y - 16), obj_collisionparent))))
    {
        state = states.normal
        jumpAnim = true
        landAnim = true
        crouchAnim = true
        image_index = 0
        jumpstop = 0
        instance_create(x, y, obj_landcloud)
    }
    if grounded
    {
        state = states.crouch
        jumpAnim = true
        crouchAnim = true
        image_index = 0
        jumpstop = 0
        instance_create(x, y, obj_landcloud)
        sound_play(sfx_land, true, (1 << 0), true)
    }
    if (jumpAnim == true)
    {
        sprite_index = spr_player_crouchjump
        if (floor(image_index) == (image_number - 1))
            jumpAnim = false
    }
    if (jumpAnim == false)
        sprite_index = spr_player_crouchfall
    if (move != 0)
        xscale = move
    if underwater
        image_speed = 0.2
    else
        image_speed = 0.35
    perform_collisions()
}

