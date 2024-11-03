if place_meeting((x + hsp), y, obj_solid)
    hsp *= -1
if place_meeting(x, (y + 1), obj_solid)
{
    instance_destroy()
    if (!nogoop)
    {
        sound_play(sfx_goopSplat, false, (1 << 0))
        instance_create(x, (y - 4), obj_goopeffect)
        instance_create(x, (y + 12), obj_trash_goop)
    }
    else
    {
        sound_play(sfx_goopSplat2, false, (1 << 0))
        with (instance_create(x, y, obj_bumpeffect))
            sprite_index = spr_goopprojectileeffect
    }
}
if (vsp < 12)
    vsp += grav
x += hsp
y += floor(vsp)
image_angle += 5
