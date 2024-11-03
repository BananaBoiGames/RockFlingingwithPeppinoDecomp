function scr_player_barrelmach2() //scr_player_barrelmach2
{
    input_get()
    hsp = xscale * movespeed
    movespeed = 10
    if (!grounded)
    {
        state = states.barrelfall
        image_index = 0
    }
    if ((!keyDash.held) && grounded)
    {
        state = states.barrelnormal
        image_index = 0
        mach2 = 0
    }
    if place_meeting((x + xscale), y, obj_solid)
    {
        barrel = 0
        state = states.bump
        hsp = -2 * xscale
        vsp = -2
        mach2 = 0
        image_index = 0
        instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
    }
    sprite_index = spr_player_barrelmach
    image_speed = 0.35
    create_mach2effect(x, y, sprite_index, (image_index - 1))
    if ((!instance_exists(obj_dashcloud)) && grounded)
        instance_create(x, y, obj_dashcloud)
    perform_collisions()
}

