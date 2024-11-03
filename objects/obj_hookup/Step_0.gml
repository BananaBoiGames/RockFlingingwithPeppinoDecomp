input_get()
if ((!hooked) && (!drop))
{
    if place_meeting(x, y, obj_player)
    {
        with (obj_player)
        {
            if (state == states.jump || state == states.Sjump || state == states.mach2 || state == states.mach3 || state == states.charge)
            {
                mach2 = 0
                state = states.hang
                xscale = 1
                other.hooked = true
                other.vspeed = -5
                sprite_index = spr_player_hang
            }
        }
    }
}
if (hooked && (!drop))
{
    obj_player.x = x
    obj_player.y = y + 40
    if keyJump.pressed
    {
        with (obj_player)
        {
            jumpAnim = false
            sprite_index = spr_player_fall
            state = states.jump
            machslideAnim = false
            image_index = 0
            vsp = -5
        }
        hooked = 0
        drop = 1
    }
}
if (place_meeting(x, y, obj_hookend) && hooked)
{
    drop = 1
    obj_player.sprite_index = spr_player_fall
    obj_player.state = states.jump
    obj_player.vsp = -7
    hooked = 0
    vsp = random_range(-4, 0)
    hsp = random_range(-4, 4)
}
if (drop == 1)
{
    if (vsp < 12)
        vsp += grav
    x += hsp
    y += floor(vsp)
}
