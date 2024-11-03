if (global.collect > 10 && state == states.hurt)
{
    alarm[11] = 10
    with (instance_create(x, y, obj_collect))
    {
        alarm[0] = 20
        cantcollect = 1
        enemydropped = true
        global.collect -= 10
        drop = 1
        hsp = (-other.image_xscale) * (random_range(3, 5))
        vsp = random_range(-3, -10)
    }
}
