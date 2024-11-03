function scr_player_barrelcrouch() //scr_player_barrelcrouch
{
    input_get()
    hsp = 0
    if (grounded && (!keyDown.held) && image_speed == 0)
    {
        state = states.barrelnormal
        movespeed = 2
        image_index = 0
    }
    sprite_index = spr_player_barrelcrouch
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
    else
        image_speed = 0.35
    perform_collisions()
}

