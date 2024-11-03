function scr_player_ladder() //scr_player_ladder
{
    input_get()
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    jumpstop = 0
    movespeed = 0
    mach2 = 0
    hsp = 0
    if (keyDown.held && (!keyUp.held))
    {
        vsp = 6
        image_speed = -0.35
        sprite_index = spr_player_ladderdown
    }
    else if ((!keyDown.held) && keyUp.held)
    {
        vsp = -2
        image_speed = 0.35
        sprite_index = spr_player_laddermove
        sound_play(sfx_climb, true, (2 << 0))
    }
    else
    {
        vsp = 0
        sprite_index = spr_player_ladder
    }
    if (!(place_meeting(x, y, obj_ladder)))
    {
        landAnim = false
        jumpAnim = false
        state = states.normal
        machslideAnim = false
        image_index = 0
        vsp = 0
    }
    if keyJump.pressed
    {
        sprite_index = spr_player_jump
        ladderbuffer = 20
        jumpAnim = true
        state = states.jump
        machslideAnim = false
        vsp = -10
        image_index = 0
    }
    if (keyDown.held && grounded && (!(place_meeting(x, y, obj_platform))))
    {
        state = states.normal
        image_index = 0
    }
    perform_collisions()
}

