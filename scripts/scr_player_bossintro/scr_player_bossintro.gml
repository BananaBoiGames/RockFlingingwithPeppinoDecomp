function scr_player_bossintro() //scr_player_bossintro
{
    input_get()
    landAnim = false
    if (sprite_index == spr_player_idle)
        image_index = 0
    xscale = 1
    if (sprite_index == spr_player_bossintro && floor(image_index) == (image_number - 1))
    {
        state = states.normal
        image_index = 0
    }
    image_speed = 0.35
    perform_collisions()
}

