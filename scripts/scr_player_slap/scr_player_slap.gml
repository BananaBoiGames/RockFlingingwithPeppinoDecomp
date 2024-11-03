function scr_player_slap() //scr_player_slap
{
    input_get()
    move = keyLeft.held + keyRight.held
    if (momemtum == 0)
        hsp = move * movespeed
    else
        hsp = xscale * movespeed
    if (move != xscale && momemtum == 1 && movespeed != 0)
        movespeed -= 0.05
    if (movespeed == 0)
        momemtum = 0
    if ((move == 0 && momemtum == 0) || (place_meeting((x + xscale), y, obj_bumpable) && (!(place_meeting((x + xscale), y, obj_slope)))))
        movespeed = 0
    if (move != 0 && movespeed < 4)
        movespeed += 0.25
    if (movespeed > 4)
        movespeed -= 0.05
    if (((place_meeting((x + 1), y, obj_bumpable) && move == 1) || (place_meeting((x - 1), y, obj_bumpable) && move == -1)) && (!(place_meeting((x + xscale), y, obj_slope))))
        movespeed = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if (move == (-xscale))
    {
        movespeed = 0
        momemtum = 0
    }
    landAnim = false
    if keySlap.held
        slapbuffer = 0
    if (floor(image_index) == (image_number - 1) && slapbuffer < 8)
    {
        if (place_meeting(x, (y + 1), obj_collisionparent) && move == 0)
        {
            if (slaphand == 1)
            {
                sound_play(sfx_slapswipe1, false, (2 << 0), true)
                sprite_index = spr_player_slap1
            }
            if (slaphand == -1)
            {
                sound_play(sfx_slapswipe2, false, (2 << 0), true)
                sprite_index = spr_player_slap2
            }
        }
        else if (place_meeting(x, (y + 1), obj_collisionparent) && move != 0)
        {
            if (slaphand == 1)
            {
                sound_play(sfx_slapswipe1, false, (2 << 0), true)
                sprite_index = spr_player_slaprun1
            }
            if (slaphand == -1)
            {
                sound_play(sfx_slapswipe2, false, (2 << 0), true)
                sprite_index = spr_player_slaprun2
            }
        }
        else
        {
            if (slaphand == 1)
            {
                sound_play(sfx_slapswipe1, false, (2 << 0), true)
                sprite_index = spr_player_slapair1
            }
            if (slaphand == -1)
            {
                sound_play(sfx_slapswipe2, false, (2 << 0), true)
                sprite_index = spr_player_slapair2
            }
        }
        image_index = 0
        slaphand *= -1
    }
    perform_collisions()
    if (place_meeting(x, (y + 1), obj_collisionparent) && move == 0)
    {
        if (slaphand == 1)
            sprite_index = spr_player_slap1
        if (slaphand == -1)
            sprite_index = spr_player_slap2
    }
    else if (place_meeting(x, (y + 1), obj_collisionparent) && move != 0)
    {
        if (slaphand == 1)
            sprite_index = spr_player_slaprun1
        if (slaphand == -1)
            sprite_index = spr_player_slaprun2
    }
    else
    {
        if (slaphand == 1)
            sprite_index = spr_player_slapair1
        if (slaphand == -1)
            sprite_index = spr_player_slapair2
    }
    if (floor(image_index) == 1 && (!instance_exists(obj_slaphitbox)))
        instance_create(x, y, obj_slaphitbox)
    if (floor(image_index) == (image_number - 1) && slapbuffer == 8)
    {
        if place_meeting(x, (y + 1), obj_collisionparent)
            state = states.normal
        else if (!(place_meeting(x, (y + 1), obj_collisionparent)))
        {
            sprite_index = spr_player_fall
            state = states.jump
        }
    }
    if (move != 0)
        xscale = move
    if ((!instance_exists(obj_cloudeffect)) && place_meeting(x, (y + 1), obj_collisionparent) && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    image_speed = 0.35
}

