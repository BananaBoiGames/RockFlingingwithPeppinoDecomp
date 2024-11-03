if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
        instance_create((x + 16), y, obj_debris)
    ds_list_add(global.saveroom, id)
    tile_destroy_multiple(32, "Tiles_1")
    sound_play(sfx_breakblock, false, (1 << 0), true)
}
