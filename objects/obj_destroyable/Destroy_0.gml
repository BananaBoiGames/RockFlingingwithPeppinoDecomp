if (ds_list_find_index(global.saveroom, id) == -1)
{
    for (var i = 0; i < image_xscale; i++)
    {
        for (var j = 0; j < image_yscale; j++)
        {
            repeat (4)
                instance_create((x + 16 + 32 * i), (y + 16 + 32 * j), obj_debris)
            sound_play(sfx_breakblock, false, (1 << 0))
        }
    }
    ds_list_add(global.saveroom, id)
    tile_destroy_multiple(32, "Tiles_1")
}
