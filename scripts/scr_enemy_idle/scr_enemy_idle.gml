function scr_enemy_idle() //scr_enemy_idle
{
    if (vsp > 1 && (place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform))))))
    {
        instance_create(x, y, obj_landcloud)
        image_index = 0
    }
    if (floor(image_index) == (image_number - 1) && roaming == 1 && (place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform))))))
    {
        state = enemystate.walk
        image_index = 0
    }
    if ((place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform))))) && vsp > 0)
        hsp = 0
    if ((!((place_meeting(x, (y + 1), obj_enemiesbumpable) || place_meeting(x, (y + 1), obj_platform)))) && hsp < 0)
        hsp += 0.1
    else if ((!((place_meeting(x, (y + 1), obj_enemiesbumpable) || place_meeting(x, (y + 1), obj_platform)))) && hsp > 0)
        hsp -= 0.1
    sprite_index = idlespr
    image_speed = 0.35
    perform_enemy_collisions()
}

