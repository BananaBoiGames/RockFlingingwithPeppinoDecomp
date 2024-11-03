function scr_player_Sjump() //scr_player_Sjump
{
    input_get()
    hsp = 0
    mach2 = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = false
    movespeed = 0
    if (sprite_index == spr_player_superjump)
    {
        vsp += 0.25
        if (vsp > 0)
            state = states.facestomp
    }
    else
        vsp--
    if (keyDash.pressed && sprite_index != spr_player_springjump)
    {
        image_index = 0
        sprite_index = spr_player_mach2jump
        instance_create(x, y, obj_machsuperjump1)
        instance_create(x, y, obj_machsuperjump2)
        state = states.Sjumpprep
        vsp = -4
        mach2 = 35
    }
    if (place_meeting(x, (y - 1), obj_collisionparent) && (!(place_meeting(x, (y - 1), obj_destructibles))))
    {
        sound_play(sfx_bumpBig, false, (1 << 0), true)
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = 30 / room_speed
        }
        with (obj_baddie)
        {
            if point_in_camera(x, y, view_camera[0])
            {
                image_index = 0
                state = enemystate.stun
                vsp = -7
                hsp = 0
                stunned = 200
            }
        }
        state = states.Sjumpland
        image_index = 0
        with (instance_create(x, y, obj_bangeffect))
            xscale = obj_player.xscale
    }
    image_speed = 0.5
    perform_solid_collisions()
}

