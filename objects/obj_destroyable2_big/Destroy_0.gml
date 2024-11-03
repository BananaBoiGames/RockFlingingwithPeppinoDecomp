if (ds_list_find_index(global.saveroom, id) == -1)
{
    for (var i = 0; i < image_xscale; i++)
    {
        for (var j = 0; j < image_yscale; j++)
        {
            repeat (8)
                instance_create((x + 16 + 32 * i), (y + 16 + 32 * j), obj_debris)
            sound_play(sfx_breakblock, false, (1 << 0))
        }
    }
    instance_create((x + 32), (y + 32), obj_bigcollect)
    ds_list_add(global.saveroom, id)
    tile_destroy(x, y, "Tiles_1")
    tile_destroy(x, (y + 32), "Tiles_1")
    tile_destroy((x + 32), y, "Tiles_1")
    tile_destroy((x + 32), (y + 32), "Tiles_1")
}
