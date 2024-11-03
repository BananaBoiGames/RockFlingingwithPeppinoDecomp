function scr_player_machroll() //scr_player_machroll
{
    input_get()
    hsp = xscale * movespeed
    mach2 = 100
    machslideAnim = false
    move = keyLeft.held + keyRight.held
    movespeed = 12
    if (((!keyDown.held) && (!(place_meeting((x + 27), (y - 32), obj_collisionparent))) && (!(place_meeting((x - 27), (y - 32), obj_collisionparent))) && (!(place_meeting(x, (y - 32), obj_collisionparent))) && (!(place_meeting(x, (y - 16), obj_collisionparent)))) || (!(place_meeting(x, (y + 1), obj_collisionparent))))
        state = states.mach2
    if (place_meeting((x + 1), y, obj_bumpable) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        sound_play(sfx_bump, false, (1 << 0), true)
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = 40 / room_speed
        }
        hsp = 0
        image_speed = 0.35
        with (obj_baddie)
        {
            if point_in_camera(x, y, view_camera[0])
            {
                stun = 1
                alarm[0] = 200
                ministun = 0
                vsp = -5
                hsp = 0
                image_xscale *= -1
            }
        }
        flash = 0
        state = states.bump
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    if (place_meeting((x - 1), y, obj_bumpable) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        sound_play(sfx_bump, false, (1 << 0), true)
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = 40 / room_speed
        }
        hsp = 0
        image_speed = 0.35
        flash = 0
        state = states.bump
        hsp = 2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    if grounded
        sprite_index = spr_player_machroll
    if (floor(image_index) == 0)
        flash = 1
    else
        flash = 0
    if ((!instance_exists(obj_cloudeffect)) && place_meeting(x, (y + 1), obj_collisionparent) && (!(place_meeting(x, (y + 1), obj_water))))
        instance_create(x, (y + 43), obj_cloudeffect)
    image_speed = 0.8
    perform_collisions()
}

