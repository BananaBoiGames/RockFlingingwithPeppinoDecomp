if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (6)
        instance_create((x + (random_range(-10, 10))), (y + (random_range(-10, obj_spitcheese))), obj_glassdebris)
    tile_destroy_multiple(32, "Tiles_1")
    sound_play(sfx_breakblock, false, (1 << 0))
    ds_list_add(global.saveroom, id)
}
