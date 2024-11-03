function scr_enemy_hit() //scr_enemy_hit
{
    if (straightthrow == 1)
        vsp = 0
    if (vsp < 0 && floor(image_index) != (image_number - 1) && sprite_index != flyingspr)
        sprite_index = hitspr
    else if (vsp < 0)
        sprite_index = flyingspr
    else if (sprite_index == flyingspr)
        sprite_index = stunfalltransspr
    else if (floor(image_index) == (image_number - 1) && sprite_index == stunfalltransspr)
        sprite_index = stunfallspr
    if ((place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform))))) && floor(vsp) > 0)
    {
        instance_create(x, y, obj_landcloud)
        state = enemystate.stun
        image_index = 0
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
    image_speed = 0.35
    perform_enemy_collisions()
    if (((place_meeting((x + 1), y, obj_enemiesbumpable) && image_xscale == -1) || (place_meeting((x - 1), y, obj_enemiesbumpable) && image_xscale == 1)) && floor(vsp) <= 0 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        sound_play(sfx_bump, false, (1 << 0), false)
        image_index = 0
        sprite_index = hitwallspr
        state = enemystate.hitwall
    }
}

