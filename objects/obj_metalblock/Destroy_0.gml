if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
        instance_create((x + 32), y, obj_metaldebris)
    ds_list_add(global.saveroom, id)
    tile_destroy(x, y, "Tiles_1")
    tile_destroy(x, (y + 32), "Tiles_1")
    tile_destroy((x + 32), y, "Tiles_1")
    tile_destroy((x + 32), (y + 32), "Tiles_1")
    sound_play(sfx_breakblock, false, (1 << 0), true)
    sound_play(sfx_breakmetal, false, (1 << 0))
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = 40 / room_speed
    }
}
