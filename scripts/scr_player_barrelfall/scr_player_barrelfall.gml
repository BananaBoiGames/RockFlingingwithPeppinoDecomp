function scr_player_barrelfall() //scr_player_barrelfall
{
    input_get()
    if place_meeting(x, y, obj_water2)
        vsp -= 1
    if place_meeting(x, (y + 1), obj_collisionparent)
    {
        state = states.barrelcrouch
        image_index = 0
    }
    if place_meeting(x, y, obj_water2)
    {
        state = states.barrelfloat
        image_index = 0
    }
    sprite_index = spr_player_barrelfall
    image_speed = 0.35
    perform_collisions()
}

