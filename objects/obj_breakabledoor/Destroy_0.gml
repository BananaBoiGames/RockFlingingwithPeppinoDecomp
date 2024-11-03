if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id)
    repeat (8)
        instance_create((x + 16), (y + 50), obj_wooddebris)
    sound_play(sfx_breakblock, false, (1 << 0), true)
}
