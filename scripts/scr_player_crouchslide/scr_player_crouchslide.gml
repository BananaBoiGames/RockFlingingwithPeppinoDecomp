function scr_player_crouchslide() //scr_player_crouchslide
{
    input_get()
    hsp = xscale * movespeed
    if (movespeed >= 0)
        movespeed -= 0.2
    if (mach2 >= 35 && (!keyDown.held) && (!(place_meeting((x + 27), (y - 32), obj_collisionparent))) && (!(place_meeting((x - 27), (y - 32), obj_collisionparent))) && (!(place_meeting(x, (y - 32), obj_collisionparent))) && (!(place_meeting(x, (y - 16), obj_collisionparent))) && keyDash.held)
        state = states.mach2
    if (((hsp == 0 || (place_meeting((x + 1), y, obj_collisionparent) && xscale == 1) || (place_meeting((x - 1), y, obj_collisionparent) && xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) || movespeed <= 0)
    {
        state = states.crouch
        movespeed = 0
        mach2 = 0
        image_index = 0
        crouchAnim = true
    }
    if (place_meeting((x + 1), y, obj_collisionparent) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
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
    if (place_meeting((x - 1), y, obj_collisionparent) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
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
    sprite_index = spr_player_crouchslip
    if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
        instance_create(x, y, obj_slidecloud)
    image_speed = 0.35
    perform_collisions()
}

