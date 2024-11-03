function scr_player_barrelroll() //scr_player_barrelroll
{
    input_get()
    hsp = xscale * movespeed
    movespeed = 12
    mach2 = 35
    if (input_buffer_jump < 8 && grounded)
        vsp = -7
    if keyJump.pressed
        input_buffer_jump = 0
    if place_meeting((x + xscale), y, obj_collisionparent)
    {
        barrel = 0
        state = states.bump
        hsp = -2 * xscale
        vsp = -2
        mach2 = 0
        image_index = 0
        instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
        repeat (10)
            instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
    }
    create_mach2effect(x, y, sprite_index, (image_index - 1))
    sprite_index = spr_player_barrelroll
    image_speed = 0.45
    perform_collisions()
}

