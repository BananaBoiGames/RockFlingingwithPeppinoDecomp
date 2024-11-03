function scr_enemy_hitwall() //scr_enemy_hitwall
{
    vsp = 0
    hsp = 0
    sprite_index = hitwallspr
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        hsp = image_xscale * (random_range(1, 4))
        sprite_index = stunfallspr
        image_index = 0
        state = enemystate.stun
    }
    if (collectdrop != 0)
    {
        ds_list_add(global.saveroom, id)
        collectdrop--
        with (instance_create(x, y, obj_collect))
        {
            alarm[0] = 20
            cantcollect = 1
            enemydropped = true
            hsp = other.image_xscale * (random_range(3, 5))
            vsp = random_range(-3, -10)
            drop = 1
        }
    }
    perform_enemy_collisions()
}

