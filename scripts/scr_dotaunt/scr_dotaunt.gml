function scr_dotaunt() //scr_dotaunt
{
    if keyTaunt.pressed
    {
        sound_play(choose(sfx_taunt1, sfx_taunt2, sfx_taunt3, sfx_taunt4, sfx_taunt5, sfx_taunt6), false, (2 << 0))
        taunttimer = 20
        tauntmovespeed = movespeed
        tauntsprite = sprite_index
        tauntindex = image_index
        tauntstate = state
        tauntmach2 = mach2
        state = states.taunt
        sprite_index = spr_player_taunt
        image_index = random_range(0, (image_number - 1))
        instance_create(x, y, obj_taunteffect)
    }
}

