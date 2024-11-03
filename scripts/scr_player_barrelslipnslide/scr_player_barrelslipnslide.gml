function scr_player_barrelslipnslide() //scr_player_barrelslipnslide
{
    input_get()
    hsp = xscale * movespeed
    if (movespeed <= 8)
        movespeed += 0.2
    sprite_index = spr_player_barrelslipnslide
    if (floor(image_index) == (image_number - 1))
    {
        state = states.barrelroll
        flash = 1
    }
    else
        image_speed = 0.35
    perform_collisions()
}

