function scr_player_stunned() //scr_player_stunned
{
    input_get()
    hsp = 0
    mach2 = 0
    jumpAnim = true
    if place_meeting(x, (y + 1), obj_collisionparent)
        landAnim = false
    else
        landAnim = true
    jumpstop = 0
    machslideAnim = false
    crouchAnim = false
    movespeed = 0
    hurted = 1
    if instance_exists(obj_hook)
        obj_hook.hooked = 0
    alarm[5] = 2
    sprite_index = spr_player_stunned
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        alarm[7] = 60
        state = states.normal
        sprite_index = spr_player_idle
        image_index = 0
    }
    perform_collisions()
}

