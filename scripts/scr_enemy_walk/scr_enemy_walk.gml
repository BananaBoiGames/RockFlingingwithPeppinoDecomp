function scr_enemy_walk() //scr_enemy_walk
{
    if grounded
        hsp = image_xscale * movespeed
    else
        hsp = 0
    if (roaming == 0 && grounded)
    {
        hsp = 0
        state = enemystate.idle
        image_index = 0
    }
    if grounded
        sprite_index = walkspr
    else
    {
        sprite_index = idlespr
        state = enemystate.idle
    }
    image_speed = 0.35
    if (((place_meeting((x + 1), y, obj_enemiesbumpable) && image_xscale == 1) || (place_meeting((x - 1), y, obj_enemiesbumpable) && image_xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
        image_xscale *= -1
    if ((!((place_meeting((x + 15), (y + 31), obj_enemiesbumpable) || place_meeting((x + 15), (y + 31), obj_platform)))) && image_xscale == 1)
        image_xscale *= -1
    if ((!((place_meeting((x - 15), (y + 31), obj_enemiesbumpable) || place_meeting((x - 15), (y + 31), obj_platform)))) && image_xscale == -1)
        image_xscale *= -1
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
    perform_enemy_collisions()
}

