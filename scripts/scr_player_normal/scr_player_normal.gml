function scr_player_normal() //scr_player_normal
{
    input_get()
    var maxmovespeed = 6
    if underwater
        maxmovespeed = 3
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    mach2 = 0
    move = keyLeft.held + keyRight.held
    hsp = move * movespeed
    if (!((keyUp.held && move == 0)))
    {
        if (machslideAnim == false && landAnim == false)
        {
            if (move == 0)
            {
                if (idle < 400)
                    idle++
                if (idle >= 300 && floor(image_index) == (image_number - 1))
                {
                    facehurt = false
                    idle = 0
                    image_index = 0
                }
                if (idle >= 300 && sprite_index != spr_player_idlefrown && sprite_index != spr_player_idledance && sprite_index != spr_player_idlevomit && sprite_index != spr_player_idlevomitblood)
                {
                    randomize()
                    idleanim = random_range(0, 100)
                    if (idleanim < 40)
                        sprite_index = spr_player_idlefrown
                    if (idleanim < 80 && idleanim >= 40)
                        sprite_index = spr_player_idledance
                    if (idleanim < 99 && idleanim >= 80)
                        sprite_index = spr_player_idlevomit
                    if (idleanim < 100 && idleanim >= 99)
                        sprite_index = spr_player_idlevomitblood
                    image_index = 0
                }
                if (idle < 300)
                {
                    if (!facehurt)
                    {
                        if (windingAnim < 50)
                        {
                            movespeed = 0
                            sprite_index = spr_player_idle
                        }
                        else
                        {
                            idle = 0
                            windingAnim--
                            sprite_index = spr_player_winding
                        }
                    }
                    else
                    {
                        windingAnim = 0
                        if (sprite_index != spr_player_facehurtup && sprite_index != spr_player_facehurt)
                            sprite_index = spr_player_facehurtup
                        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_facehurtup)
                            sprite_index = spr_player_facehurt
                    }
                }
            }
            if (move != 0)
            {
                idle = 0
                facehurt = false
                machslideAnim = false
                sprite_index = spr_player_move
            }
            if (move != 0)
                xscale = move
        }
        if (landAnim == true)
        {
            if (move == 0)
            {
                movespeed = 0
                sprite_index = spr_player_land
                if (floor(image_index) == (image_number - 1))
                    landAnim = false
            }
            if (move != 0)
            {
                sprite_index = spr_player_land2
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = false
                    sprite_index = spr_player_move
                    image_index = 0
                }
            }
        }
        if (machslideAnim == true)
        {
            sprite_index = spr_player_machslideend
            if (floor(image_index) == (image_number - 1))
                machslideAnim = false
        }
    }
    if (keyDash.held && grounded && (!((place_meeting((x + 1), y, obj_collisionparent) && xscale == 1 && (!(place_meeting((x + xscale), y, obj_slope)))))) && (!((place_meeting((x - 1), y, obj_collisionparent) && xscale == -1 && (!(place_meeting((x + xscale), y, obj_slope)))))))
    {
        jumpAnim = true
        state = states.mach1
        movespeed = 0
        image_index = 0
    }
    if (keyUp.held && move == 0)
    {
        if (sprite_index != spr_player_Sjumpprep)
            image_index = 0
        landAnim = false
        sprite_index = spr_player_Sjumpprep
        if (floor(image_index) == (image_number - 1))
            image_speed = 0
    }
    if (place_meeting((x + sign(hsp)), y, obj_collisionparent) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))))
        movespeed = 0
    if (place_meeting((x + sign(hsp)), y, obj_collisionparent) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))))
        movespeed = 0
    jumpstop = 0
    if (!grounded)
    {
        if (move != 0)
            sprite_index = spr_player_fall2
        else
            sprite_index = spr_player_fall
        jumpAnim = false
        state = states.jump
        machslideAnim = false
        image_index = 0
    }
    if (keyJump.pressed && grounded && keyUp.held && (!keyDown.held) && (!keyDash.held) && move == 0)
    {
        if (!underwater)
            vsp = -12
        else
            vsp = -10
        state = states.highjump
        image_index = 0
        machslideAnim = false
        jumpAnim = true
        sound_play(sfx_jump, false, (1 << 0))
    }
    if (grounded && (keyJump.pressed || (input_buffer_jump < 8 && (!keyDash.held) && vsp > 0)) && (!keyDown.held) && sprite_index != spr_player_Sjumpprep)
    {
        if (move != 0)
            sprite_index = spr_player_jump2
        else
            sprite_index = spr_player_jump
        if (!underwater)
            vsp = -10
        else
            vsp = -8.5
        state = states.jump
        image_index = 0
        machslideAnim = false
        jumpAnim = true
        instance_create(x, y, obj_landcloud)
        sound_play(sfx_jump, false, (1 << 0))
    }
    if ((keyDown.held && grounded) || (place_meeting(x, (y - 3), obj_collisionparent) && grounded))
    {
        state = states.crouch
        machslideAnim = false
        landAnim = false
        crouchAnim = true
        image_index = 0
        idle = 0
    }
    if (move != 0)
    {
        if (movespeed < maxmovespeed)
            movespeed += 0.5
        else if (floor(movespeed) == maxmovespeed)
            movespeed = maxmovespeed
    }
    else
        movespeed = 0
    if (movespeed > maxmovespeed)
        movespeed -= 0.1
    if (!((keyUp.held && move == 0)))
    {
        if underwater
            image_speed = 0.2
        else if (move != 0)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45
            else
                image_speed = 0.6
        }
        else
            image_speed = 0.35
    }
    if (keySlap.pressed && (!suplexmove))
    {
        sound_play(sfx_suplexdash, false, (2 << 0))
        suplexmove = true
        sprite_index = spr_player_suplexdash
        image_index = 0
        state = states.suplexdash
    }
    scr_dotaunt()
    if (hsp != 0)
        sound_play(sfx_step, true, (2 << 0), true)
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    perform_collisions()
}

