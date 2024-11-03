if (state == enemystate.stun && hp <= 0 && stunned > 100 && (!slapped) && (!flying))
{
    sound_play(sfx_slap, false, (1 << 0), true)
    slapped = true
    instance_create((x + obj_player.xscale * 40), y, obj_punchdust)
    state = enemystate.grabbed
    x = obj_player.x
    y = obj_player.y
    obj_player.baddiegrabbedID = id
    obj_player.movespeed = 0
    obj_player.state = states.grabbing
    instance_destroy(other.id)
}
if ((hp <= 0 && (!((state == enemystate.stun && stunned > 100))) && state != enemystate.grabbed && (!slapped)) || flying)
{
    sound_play(sfx_slap, false, (1 << 0), true)
    with (instance_create(x, y, obj_spikehurteffect))
        image_xscale = other.image_xscale
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_bangeffect)
    instance_create(x, y, obj_bumpeffect)
    slapped = true
    flash = true
    stunned = 200
    if (other.x != x)
        image_xscale = (-(sign(x - other.x)))
    if obj_player.keyUp.held
    {
        vsp = -16
        hsp = (-image_xscale) * 1
    }
    else
    {
        vsp = -5
        if flying
            hsp = (-image_xscale) * 16
        else
            hsp = (-image_xscale) * 8
    }
    state = enemystate.stun
    obj_player.vsp = -3
    obj_player.hsp = 0
    obj_player.movespeed = 0
    obj_player.image_index = 0
    obj_player.sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7)
    obj_player.state = states.grabfinish
}
else if (state != enemystate.grabbed && (!slapped) && (!flying))
{
    sound_play(sfx_slap, false, (1 << 0), true)
    if (hp > 0)
        hp -= 1
    with (instance_create(x, y, obj_spikehurteffect))
        image_xscale = other.image_xscale
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_bangeffect)
    instance_create(x, y, obj_bumpeffect)
    slapped = true
    state = enemystate.stun
    stunned = 100
    if (other.x != x)
        image_xscale = (-(sign(x - other.x)))
    if obj_player.keyUp.held
    {
        vsp = -16
        hsp = (-image_xscale) * 1
    }
    else
    {
        vsp = -4
        hsp = (-image_xscale) * 3
    }
    obj_player.vsp = -3
    obj_player.hsp = 0
    obj_player.movespeed = 0
    obj_player.image_index = 0
    obj_player.sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7)
    obj_player.state = states.grabfinish
}
