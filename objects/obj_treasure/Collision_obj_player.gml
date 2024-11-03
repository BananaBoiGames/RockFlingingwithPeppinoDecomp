with (obj_player)
{
    hsp = 0
    if place_meeting(x, (y + 1), obj_collisionparent)
    {
        if (other.sprite_index == spr_treasure1)
        {
            other.alarm[0] = 300
            sound_play(sfx_collectTreasure)
        }
        if (other.sprite_index == spr_treasure1)
            state = states.gottreasure
        ds_list_add(global.saveroom, other.id)
        other.sprite_index = spr_treasure1pick
        other.x = obj_player.x
        other.y = obj_player.y - 35
    }
}
