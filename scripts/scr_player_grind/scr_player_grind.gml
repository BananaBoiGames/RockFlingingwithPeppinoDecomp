function scr_player_grind() //scr_player_grind
{
    input_get()
    vsp = 0
    hsp = floor(xscale * movespeed)
    if (keyJump.pressed && place_meeting(x, (y + 1), obj_grindrailnormal))
    {
        vsp = -6
        state = states.mach2
    }
    if (!(place_meeting(x, (y + 1), obj_grindrailnormal)))
        state = states.mach2
    sprite_index = spr_player_grind
    image_speed = 0.35
    if (!instance_exists(obj_grindeffect))
        instance_create(x, y, obj_grindeffect)
    perform_collisions()
}

