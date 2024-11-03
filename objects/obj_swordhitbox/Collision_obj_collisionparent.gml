if (bumpeffect == 0)
{
    sound_play(sfx_swordhitwall, false, (1 << 0))
    with (instance_create((x + image_xscale * 40), y, obj_spikehurteffect))
        other.image_xscale = image_xscale
    obj_player.movespeed = 4
    bumpeffect = 1
}
