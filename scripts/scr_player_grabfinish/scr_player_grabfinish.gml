function scr_player_grabfinish() //scr_player_grabfinish
{
    input_get()
    if (windingAnim < 200)
        windingAnim += 5
    movespeed = 0
    mach2 = 0
    jumpAnim = true
    landAnim = false
    machslideAnim = false
    crouchAnim = true
    if (floor(image_index) == (image_number - 1))
        state = states.normal
    image_speed = 0.35
    perform_collisions()
}

