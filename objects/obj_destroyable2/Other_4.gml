if (ds_list_find_index(global.saveroom, id) != -1)
{
    tile_destroy_multiple(32, "Tiles_1")
    instance_destroy()
}
