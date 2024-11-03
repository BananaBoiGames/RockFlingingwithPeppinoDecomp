if (drop == 1)
{
    if (jump == 0)
    {
        vsp = -6
        hsp = random_range(-4, 4)
        jump = 1
    }
    grav = 0.4
    if (vsp < 12)
        vsp += grav
    x += hsp
    y += floor(vsp)
}
