function scr_player_barrelfloat() //scr_player_barrelfloat
{
    input_get()
    sprite_index = spr_player_barrelfloat
    image_speed = 0.35
    move = keyLeft.held + keyRight.held
    hsp = move * movespeed
    vsp = 0
    if keyJump.pressed
    {
        jumpstop = 1
        jumpAnim = true
        sprite_index = spr_player_jump
        state = states.jump
        landAnim = false
        vsp = -9
        with (instance_create(x, (y + 16), obj_barrelfloat))
            image_xscale = other.image_xscale
        image_index = 0
        barrel = 0
    }
    movespeed = 4.5
    if (move != 0)
        xscale = move
    if place_meeting(x, y, obj_water2)
        vsp -= 1
    perform_collisions()
}

