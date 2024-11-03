function scr_player_hurt() //scr_player_hurt
{
    input_get()
    hsp = (-xscale) * movespeed
    if (movespeed > 0)
        movespeed -= 0.1
    mach2 = 0
    jumpAnim = true
    if grounded
        landAnim = false
    else
        landAnim = true
    jumpstop = 0
    machslideAnim = false
    crouchAnim = false
    hurted = 1
    if instance_exists(obj_hook)
        obj_hook.hooked = 0
    alarm[5] = 2
    if grounded
        vsp = -5
    if place_meeting((x + hsp), y, obj_collisionparent)
        xscale *= -1
    if (floor(image_index) == 0)
        alarm[11] = 10
    if (floor(image_index) == (image_number - 1))
    {
        alarm[7] = 60
        state = states.normal
    }
    sprite_index = spr_player_hurt
    image_speed = 0.35
    perform_collisions()
}

