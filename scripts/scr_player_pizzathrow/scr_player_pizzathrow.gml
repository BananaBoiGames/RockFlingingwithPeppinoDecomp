function scr_player_pizzathrow() //scr_player_pizzathrow
{
    input_get()
    movespeed = 0
    mach2 = 0
    hsp = 0
    xscale = -1
    jumpstop = 0
    if (!instance_exists(obj_pizzabox))
    {
        state = states.smirk
        landAnim = false
        movespeed = 4
        mach2 = 0
        image_index = 0
        machslideAnim = false
    }
    if (keyJump.pressed && place_meeting(x, (y + 1), obj_collisionparent) && (!keyDown.held) && (!keySlap.pressed) && (!instance_exists(obj_pizzabox)))
    {
        sprite_index = spr_player_jump
        vsp = -7
        state = states.jump
        image_index = 0
        machslideAnim = false
        jumpAnim = true
        sound_play(sfx_jump, false, (1 << 0))
    }
    if (!instance_exists(obj_pizzabox))
    {
        instance_create(x, (y - 75), obj_pizzabox)
        sprite_index = spr_player_pizzathrow
    }
    if instance_exists(obj_pizzabox)
    {
        if (obj_pizzabox.throwed == 0 && keySlap.pressed)
        {
            obj_pizzabox.inpizzabox = 1
            obj_pizzabox.hsp = -4
            obj_pizzabox.throwed = 1
            obj_pizzabox.vsp = -10
        }
    }
    if keySlap.pressed
        sprite_index = spr_player_pizzathrow2
    if (floor(image_index) == (image_number - 1))
        sprite_index = spr_player_pizzathrow3
    image_speed = 0.35
    perform_collisions()
}

