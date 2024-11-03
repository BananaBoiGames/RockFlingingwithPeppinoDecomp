if (other.attacking && (!hit))
{
    hit = true
    alarm[1] = 30
    sound_play(sfx_slap, false, (1 << 0), true)
    instance_create(x, y, obj_bumpeffect)
    vsp = -6
    if (other.state == states.charge)
        hsp = other.xscale * other.movespeed * 1.85
    else
        hsp = other.xscale * 12
}
