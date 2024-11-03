if (ds_list_find_index(global.saveroom, id) != -1)
    collectdrop = 0
if (ds_list_find_index(global.baddieroom, id) != -1)
    instance_destroy()
