if (ds_list_find_index(global.saveroom, id) == -1)
{
    for (var i = 0; i < image_xscale; i++)
    {
        for (var j = 0; j < image_yscale; j++)
        {
            with (instance_create((x + 32 * i), (y + 32 * j), obj_enemyblockdead))
            {
                hsp = random_range(-15, 15)
                vsp = -10
            }
        }
    }
    ds_list_add(global.saveroom, id)
}
