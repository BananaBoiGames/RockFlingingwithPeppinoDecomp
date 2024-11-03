function scr_pizzagoblin_throw() //scr_pizzagoblin_throw
{
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0
        global.throw_frame[obj_pizzagoblin] = 2
        global.throw_frame[obj_spitcheese] = 2
        global.throw_frame[obj_trash] = 1
        global.throw_sprite = -4
        global.throw_sprite[obj_pizzagoblin] = spr_pizzagoblin_throwbomb
        global.throw_sprite[obj_spitcheese] = spr_spitcheese_spit
        global.throw_sprite[obj_trash] = spr_trash_throw
        global.reset_timer = 0
        global.reset_timer[obj_pizzagoblin] = 200
        global.reset_timer[obj_spitcheese] = 100
        global.reset_timer[obj_trash] = 100
    }
    hsp = 0
    if (throwtimer <= 0 && floor(image_index) == global.throw_frame[object_index])
    {
        throwtimer = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_bomb))
                {
                    hsp = other.image_xscale * 5
                    vsp = -5
                }
                break
            case obj_spitcheese:
                with (instance_create((x + image_xscale * 6), (y - 6), obj_spitcheese_spike))
                {
                    image_xscale = other.image_xscale
                    hsp = other.image_xscale * 5
                    vsp = -6
                }
                break
            case obj_trash:
                with (instance_create((x + image_xscale * 6), y, obj_trash_goopprojectile))
                {
                    image_xscale = other.image_xscale
                    hsp = other.image_xscale * 5
                    vsp = -6
                }
                break
        }

    }
    if (floor(image_index) == (image_number - 1))
    {
        state = enemystate.idle
        image_index = 0
    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
    image_speed = 0.35
    perform_enemy_collisions()
}

