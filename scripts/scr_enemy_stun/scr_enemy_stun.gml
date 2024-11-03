function scr_enemy_stun() //scr_enemy_stun
{
    var current = (place_meeting(x, y, obj_current) || place_meeting(x, y, obj_current2))
    if ((!flying) && (!current))
        stunned--
    sprite_index = stunfallspr
    image_speed = 0.35
    if place_meeting(x, y, obj_current)
        hsp = -15
    if place_meeting(x, y, obj_current2)
        hsp = 15
    if ((place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform))))) && vsp > 0 && (!current))
    {
        hsp = 0
        if flying
            instance_destroy()
    }
    if (floor(image_index) == (image_number - 1) && stunned < 0)
    {
        vsp -= 4
        sprite_index = idlespr
        image_index = 0
        state = enemystate.idle
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

