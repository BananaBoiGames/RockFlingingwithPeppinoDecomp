if (collectdrop != 0)
{
    ds_list_add(global.saveroom, id)
    for (i = 0; i < collectdrop; i++)
        global.collect += 10
}
outsideroom = true
instance_destroy()
