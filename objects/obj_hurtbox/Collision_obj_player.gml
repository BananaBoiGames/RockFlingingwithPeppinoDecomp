with (obj_player)
{
    if (state == states.knightpep || state == states.knightpepattack)
    {
        sound_play(sfx_knightEnd, false, (1 << 0))
        with (instance_create(x, y, obj_knightdebris))
            image_index = 0
        with (instance_create(x, y, obj_knightdebris))
            image_index = 1
        with (instance_create(x, y, obj_knightdebris))
            image_index = 2
        with (instance_create(x, y, obj_knightdebris))
            image_index = 3
        with (instance_create(x, y, obj_knightdebris))
            image_index = 4
        with (instance_create(x, y, obj_knightdebris))
            image_index = 5
        if (x != other.x)
            obj_player.hsp = (sign(x - other.x)) * 5
        else
            obj_player.hsp = 5
        vsp = -3
        image_index = 0
        obj_player.image_index = 0
        obj_player.flash = 1
        state = states.bump
    }
    else if (state == states.bombpep && hurted == 0)
        instance_create(x, y, obj_bombexplosion)
    else if (state != states.hurt && hurted == 0 && state != states.bump)
    {
        sound_play(sfx_hurt, false, (2 << 0))
        movespeed = 8
        vsp = -5
        instance_create(x, y, obj_spikehurteffect)
        state = states.hurt
        if (global.collect >= 10)
            global.collect -= 10
        image_index = 0
        flash = 1
        if barrel
        {
            barrel = false
            repeat (10)
                instance_create((x + (random_range(15, -15))), (y + (random_range(15, -15))), obj_wooddebris)
        }
    }
}
