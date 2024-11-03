function scr_player_machslide() //scr_player_machslide
{
    input_get()
    hsp = xscale * movespeed
    move = keyLeft.held + keyRight.held
    if (sprite_index == spr_player_machslide || sprite_index == spr_player_machslideend || sprite_index == spr_player_machslidestart)
        mach2 = 0
    if (movespeed >= 0 && (!underwater))
        movespeed -= 0.4
    if (movespeed >= 0 && underwater)
        movespeed -= 0.2
    if (sprite_index == spr_player_machslidestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_machslide
    if (sprite_index == spr_player_crouchslidestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_crouchslide
    landAnim = false
    if (floor(hsp) == 0 && sprite_index != spr_player_machslideboost && sprite_index != spr_player_machslideboost3)
    {
        movespeed = 0
        state = states.normal
        movespeed = 4
        mach2 = 0
        image_index = 0
        if (sprite_index == spr_player_machslide)
            machslideAnim = true
    }
    if (floor(hsp) == 0 && (sprite_index == spr_player_machslideboost || sprite_index == spr_player_machslideboost3))
    {
        xscale *= -1
        state = states.mach2
        image_index = 0
        instance_create(x, y, obj_jumpdust)
    }
    if (place_meeting((x + 1), y, obj_collisionparent) && xscale == 1 && (!(place_meeting((x + 1), y, obj_slope))))
    {
        movespeed = 0
        state = states.bump
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        machslideAnim = false
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    if (place_meeting((x - 1), y, obj_collisionparent) && xscale == -1 && (!(place_meeting((x - 1), y, obj_slope))))
    {
        movespeed = 0
        state = states.bump
        hsp = 2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        machslideAnim = false
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    if ((sprite_index == spr_player_machslideboost || sprite_index == spr_player_machslideboost3) && floor(image_index) == (image_number - 1))
        image_speed = 0
    else
        image_speed = 0.35
    if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
        instance_create(x, y, obj_slidecloud)
    perform_collisions()
}

