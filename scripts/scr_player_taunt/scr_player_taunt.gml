function scr_player_taunt() //scr_player_taunt
{
    mach2 = 0
    hsp = 0
    vsp = 0
    movespeed = 0
    landAnim = false
    if (alarm[9] > 1 && combo >= 2)
        alarm[9]++
    if (taunttimer > 0)
        taunttimer--
    else
    {
        movespeed = tauntmovespeed
        sprite_index = tauntsprite
        image_index = tauntindex
        state = tauntstate
        mach2 = tauntmach2
        if (alarm[9] > 1 && combo >= 2)
        {
            alarm[9] = 1
            if (combo == 2)
            {
                instance_create(x, y, obj_20)
                sound_play(sfx_combo2, false, (1 << 0))
                global.collect += 20
            }
            if (combo == 3)
            {
                instance_create(x, y, obj_40)
                sound_play(sfx_combo3, false, (1 << 0))
                global.collect += 40
            }
            if (combo >= 4)
            {
                instance_create(x, y, obj_80)
                sound_play(sfx_combo4, false, (1 << 0))
                global.collect += 80
            }
        }
    }
    image_speed = 0.35
}

