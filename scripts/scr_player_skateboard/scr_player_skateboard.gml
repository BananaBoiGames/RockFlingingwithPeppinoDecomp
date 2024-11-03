function scr_player_skateboard() //scr_player_skateboard
{
    input_get()
    hsp = floor(xscale * movespeed)
    if keyJump.pressed
    {
        state = states.mach2
        vsp = -6
        with (instance_create((x + xscale * movespeed), y, obj_skateboard))
        {
            xscale = other.xscale
            hsp = other.hsp
            vsp = -5
        }
    }
    if (place_meeting((x + 1), y, obj_bumpable) && xscale == 1)
    {
        state = states.bump
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
        instance_create(x, (y + 10), obj_skateboarddebris1)
        instance_create(x, (y + 10), obj_skateboarddebris2)
    }
    else if (place_meeting((x - 1), y, obj_bumpable) && xscale == -1)
    {
        state = states.bump
        hsp = 2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
        instance_create(x, (y + 10), obj_skateboarddebris1)
        instance_create(x, (y + 10), obj_skateboarddebris2)
    }
    sprite_index = spr_player_skateboard
    image_speed = 0.35
    if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
        instance_create(x, y, obj_slidecloud)
    perform_collisions()
}

