if ((!stun) && (!instance_exists(obj_slaphitbox)))
{
    attack = 1
    alarm[0] = 50
    image_xscale = (-(sign(x - other.x)))
    event_inherited()
}
