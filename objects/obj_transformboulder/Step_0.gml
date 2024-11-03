hsp = image_xscale * 10
if (vsp < 12)
    vsp += grav
if place_meeting((x + 1), y, obj_solid)
{
    with (obj_player)
    {
        if (state == states.boulder && place_meeting(x, y, other.id))
        {
            barrel = 0
            state = states.bump
            hsp = -2
            vsp = -2
            mach2 = 0
            image_index = 0
            instance_create((x + 10), (y + 10), obj_bumpeffect)
            repeat (10)
                instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        }
    }
    instance_destroy()
}
perform_solid_collisions()
