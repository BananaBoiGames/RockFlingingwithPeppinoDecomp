function scr_enemy_grabbed() //scr_enemy_grabbed
{
    image_xscale = (-obj_player.xscale)
    stunned = 200
    obj_player.baddiegrabbedID = id
    if (obj_player.state == states.grabbing || obj_player.state == states.slam)
    {
        depth = -1
        x = obj_player.x + obj_player.xscale * 15
        y = obj_player.y
        image_xscale = (-obj_player.xscale)
    }
    with (obj_player)
    {
        if (!((state == states.grabbing || state == states.grabfinish || state == states.slam)))
        {
            other.x = x
            other.y = y
            other.state = enemystate.stun
            other.image_index = 0
        }
        if (keyDown.held && state == states.grabbing && grounded)
        {
            image_index = 0
            state = states.normal
            other.state = enemystate.stun
            other.hsp = (-other.image_xscale) * 9
            other.vsp = -2
        }
    }
    hsp = 0
    if (obj_player.sprite_index == spr_player_punch && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 5
        flying = true
        x = obj_player.x
        y = obj_player.y
        state = enemystate.stun
        hsp = (-image_xscale) * 15
        vsp = -6
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create((x + obj_player.xscale * 10), y, obj_bangeffect)
    }
    if (obj_player.sprite_index == spr_player_uppunch && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 5
        flying = true
        x = obj_player.x
        y = obj_player.y
        hsp = (-image_xscale) * 2
        state = enemystate.stun
        vsp = -20
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(obj_player.x, (obj_player.y - 40), obj_bangeffect)
    }
    if (obj_player.sprite_index == spr_player_shoulder && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 5
        flying = true
        x = obj_player.x
        y = obj_player.y
        hsp = (-image_xscale) * 2
        state = enemystate.stun
        vsp = 10
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(obj_player.x, (obj_player.y + 46), obj_bangeffect)
    }
    if (obj_player.sprite_index == spr_player_upthrow && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 5
        flying = true
        x = obj_player.x
        y = obj_player.y
        hsp = (-image_xscale) * 14
        vsp = -15
        state = enemystate.stun
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(obj_player.x, (obj_player.y + 46), obj_bangeffect)
    }
    if (obj_player.sprite_index == spr_player_downthrow && floor(obj_player.image_index) == 0)
    {
        alarm[1] = 5
        flying = true
        x = obj_player.x
        y = obj_player.y
        hsp = (-image_xscale) * 14
        vsp = 15
        state = enemystate.stun
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(obj_player.x, (obj_player.y + 46), obj_bangeffect)
    }
    if (obj_player.state == states.slam && obj_player.slamming == 0)
    {
        depth = -7
        x = obj_player.x
        y = obj_player.y + 20
    }
    if (obj_player.state == states.slam && obj_player.slamming == 1)
    {
        alarm[1] = 5
        flying = true
        x = obj_player.x
        y = obj_player.y
        state = enemystate.stun
        hsp = (-image_xscale) * 10
        vsp = -8
        sound_play(sfx_punch, false, (1 << 0), true)
        instance_create(x, y, obj_bangeffect)
    }
    sprite_index = grabbedspr
    image_speed = 0.35
}

