function scr_player_smirk() //scr_player_smirk
{
    input_get()
    image_speed = 0.35
    sprite_index = spr_player_smirk
    if (obj_hungrypillar.timeadded == 0)
    {
        state = states.normal
        image_index = 0
        instance_destroy(obj_pizzastand)
        obj_camera.alarm[1] = 1
    }
    perform_collisions()
}

