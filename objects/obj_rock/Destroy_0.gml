if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x, y, obj_baddiedead))
        sprite_index = other.sprite_index
    ds_list_add(global.saveroom, id)
}
