input_get()
switch state
{
    case states.normal:
        udmove = keyUp.held - keyDown.held
        lrmove = keyLeft.held + keyRight.held
        if (!(place_meeting((x + lrspeed * hdir), y, obj_solid)))
            x += (lrspeed * hdir)
        if (!(place_meeting(x, (y + udspeed * vdir), obj_solid)))
            y += (udspeed * vdir)
        if (udmove != 0 || lrmove != 0)
            sprite_index = worldmap_get_sprite("spr_worldpep_move")
        else
            sprite_index = worldmap_get_sprite("spr_worldpep_idle")
        if (udmove != 0)
        {
            udspeed = 5
            vdir = (-udmove)
        }
        else
        {
            udspeed = 0
            vdir = 0
        }
        if (lrmove != 0)
        {
            lrspeed = 5
            hdir = lrmove
        }
        else
        {
            lrspeed = 0
            hdir = 0
        }
        break
    case states.menu:
        udspeed = 0
        lrspeed = 0
        sprite_index = worldmap_get_sprite("spr_worldpep_idle")
        break
}

