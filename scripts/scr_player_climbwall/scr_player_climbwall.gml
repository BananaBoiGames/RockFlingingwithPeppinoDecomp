function scr_player_climbwall() //scr_player_climbwall
{
    input_get()
    if (windingAnim < 200)
        windingAnim++
    vsp = (-movespeed)
    mach2 = 60
    if (movespeed > 0)
        movespeed -= 0.5
    sprite_index = spr_player_climbwall
    if (!keyDash.held)
    {
        state = states.jump
        sprite_index = spr_player_fall
    }
    if (!(place_meeting((x + xscale), y, obj_collisionparent)))
    {
        instance_create(x, y, obj_jumpdust)
        vsp = 0
        mach2 = 60
        state = states.mach2
    }
    if ((place_meeting(x, (y + 1), obj_collisionparent) && movespeed <= 0) || movespeed <= 0)
    {
        state = states.jump
        sprite_index = spr_player_fall
    }
    image_speed = 0.6
    if (!instance_exists(obj_cloudeffect))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (keyJump.pressed && keyDash.held)
    {
        instance_create(x, y, obj_jumpdust)
        mach2 = 60
        vsp = -9
        state = states.mach2
        xscale *= -1
    }
    perform_collisions()
}

