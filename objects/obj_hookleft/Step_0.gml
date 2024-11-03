input_get()
if ((!hooked) && (!drop))
{
    if place_meeting(x, y, obj_player)
    {
        with (obj_player)
        {
            if (state == states.jump || state == states.Sjump || state == states.mach2 || state == states.mach3 || state == states.charge)
            {
                state = states.hang
                xscale = -1
                other.hooked = true
                if (mach2 >= 35)
                    other.hspeed = -10
                if (other.hspeed == -10)
                    sprite_index = spr_player_hangslide
                if (other.hspeed == 0)
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
            sprite_index = spr_player_fall
            jumpAnim = false
            state = states.jump
            machslideAnim = false
            image_index = 0
            vsp = -5
        }
        hooked = 0
        drop = 1
    }
}
if (place_meeting(x, (y - 31), obj_hookend) && hooked)
{
    drop = 1
    obj_player.state = states.mach2
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
