if (ds_list_find_index(global.saveroom, id) == -1)
{
    sound_play(sfx_enemyKill, false, (1 << 0), true)
    global.collect += 100
    instance_create(x, y, obj_100)
    ds_list_add(global.saveroom, id)
    with (instance_create((x + 48), (y + 48), obj_baddiedead))
        sprite_index = spr_bigrat_dead
}
