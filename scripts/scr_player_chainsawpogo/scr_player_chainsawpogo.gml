function scr_player_chainsawpogo() //scr_player_chainsawpogo
{
    input_get()
    hsp = xscale * movespeed
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
    if (ladderbuffer > 0)
        ladderbuffer--
    if (place_meeting(x, (y - 1), obj_collisionparent) && jumpstop == 0 && jumpAnim == true)
    {
        vsp = grav
        jumpstop = 1
    }
    if ((place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0) || (!keyChainsaw.held))
    {
        sprite_index = spr_player_fall
        state = states.jump
        jumpAnim = false
        jumpstop = 0
    }
    if (sprite_index != spr_player_chainsawpogobounce)
    {
        if (sprite_index == spr_player_chainsawpogo1 && floor(image_index) == (image_number - 1))
            sprite_index = spr_player_chainsawpogo2
    }
    else if (floor(image_index) == (image_number - 1))
        sprite_index = spr_player_chainsawpogo2
    image_speed = 0.35
    if (move != 0)
        xscale = move
    image_speed = 0.35
    perform_collisions()
}

