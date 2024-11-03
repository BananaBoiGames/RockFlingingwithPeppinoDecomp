if (ds_list_find_index(global.baddieroom, id) == -1)
{
    ds_list_add(global.baddieroom, id)
    obj_player.alarm[9] = 100
    obj_player.combo += 1
    if (obj_player.combo == 1)
    {
        instance_create(x, y, obj_10)
        sound_play(sfx_combo1, false, (1 << 0))
        global.collect += 10
    }
    if (obj_player.combo == 2)
    {
        instance_create(x, y, obj_20)
        sound_play(sfx_combo2, false, (1 << 0))
        global.collect += 20
    }
    if (obj_player.combo == 3)
    {
        instance_create(x, y, obj_40)
        sound_play(sfx_combo3, false, (1 << 0))
        global.collect += 40
    }
    if (obj_player.combo >= 4)
    {
        instance_create(x, y, obj_80)
        sound_play(sfx_combo4, false, (1 << 0))
        global.collect += 80
    }
    if (collectdrop != 0 && (!outsideroom))
    {
        ds_list_add(global.saveroom, id)
        for (i = 0; i < collectdrop; i++)
        {
            with (instance_create(x, y, obj_collect))
            {
                alarm[0] = 20
                enemydropped = true
                cantcollect = 1
                hsp = other.image_xscale * (random_range(3, 5))
                vsp = random_range(-3, -10)
                drop = 1
            }
        }
    }
    if (object_index == obj_cheeseslime)
    {
        repeat (10)
            instance_create((x + 16), y, obj_slimedebris)
        instance_create(x, y, obj_slimedead)
    }
    else
    {
        repeat (3)
            instance_create(x, y, obj_baddiegibs)
        with (instance_create(x, y, obj_baddiedead))
            sprite_index = other.deadspr
    }
    sound_play(sfx_enemyKill, false, (1 << 0), true)
}
