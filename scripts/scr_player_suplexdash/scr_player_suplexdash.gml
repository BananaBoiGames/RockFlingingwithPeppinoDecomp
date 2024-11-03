function scr_player_suplexdash() //scr_player_suplexdash
{
    input_get()
    move = keyLeft.held + keyRight.held
    hsp = xscale * movespeed
    vsp = 0
    sprite_index = spr_player_suplexdash
    landAnim = false
    momemtum = true
    dir = xscale
    if (image_index < 2)
        movespeed = 12
    if (image_index > 7 && movespeed > 0)
        movespeed--
    if (floor(image_index) == (image_number - 1) || move == (-xscale))
        state = states.normal
    if (place_meeting((x + sign(hsp)), y, obj_bumpable) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        state = states.bump
        hsp = -2.5 * xscale
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
        sound_play(sfx_bump, false, (1 << 0), true)
    }
    if (!instance_exists(obj_slaphitbox))
        instance_create(x, y, obj_slaphitbox)
    image_speed = 0.4
    perform_collisions()
}

