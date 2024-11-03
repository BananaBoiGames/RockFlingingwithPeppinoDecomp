if grabbed
{
    hsp = 0
    obj_player.baddiegrabbedID = id
    if (obj_player.state == states.grabbing || obj_player.state == states.slam)
    {
        depth = -1
        x = obj_player.x + obj_player.xscale * 25
        y = obj_player.y
    }
    with (obj_player)
    {
        if (!((state == states.grabbing || state == states.slam)))
        {
            other.x = x
            other.y = y
            other.grabbed = false
            other.image_index = 0
        }
        if (keyDown.held && state == states.grabbing && grounded)
        {
            image_index = 0
            state = states.normal
            other.grabbed = false
            other.hsp = xscale * 2
            other.vsp = -2
        }
    }
    if (obj_player.sprite_index == spr_player_punch && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 30
        hit = true
        x = obj_player.x
        y = obj_player.y
        hsp = obj_player.xscale * 15
        vsp = -8
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create((x + obj_player.xscale * 10), y, obj_bangeffect)
    }
    if (obj_player.sprite_index == spr_player_uppunch && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 30
        hit = true
        x = obj_player.x
        y = obj_player.y
        hsp = obj_player.xscale
        vsp = -13
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(obj_player.x, (obj_player.y - 40), obj_bangeffect)
    }
    if (obj_player.sprite_index == spr_player_shoulder && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 30
        hit = true
        x = obj_player.x
        y = obj_player.y
        hsp = obj_player.xscale * 2
        vsp = 10
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(obj_player.x, (obj_player.y + 46), obj_bangeffect)
    }
    if (obj_player.sprite_index == spr_player_upthrow && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 30
        hit = true
        x = obj_player.x
        y = obj_player.y
        hsp = obj_player.xscale * 14
        vsp = -13
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(obj_player.x, (obj_player.y + 46), obj_bangeffect)
    }
    if (obj_player.sprite_index == spr_player_downthrow && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 30
        hit = true
        x = obj_player.x
        y = obj_player.y
        hsp = obj_player.xscale * 14
        vsp = 13
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(obj_player.x, (obj_player.y + 46), obj_bangeffect)
    }
}
else
{
    perform_enemy_collisions()
    if (hsp > 0 && grounded && vsp > 0)
        hsp--
    if (hsp < 0 && grounded && vsp > 0)
        hsp++
    if grounded
        slapped = false
}
