with (obj_player)
{
    if (state == states.barrelmach1 || state == states.barrelmach2)
    {
        image_index = 0
        state = states.barrelslipnslide
        if (movespeed < 8)
            movespeed = 8
    }
    else if (state != states.barrelroll)
    {
        state = states.slipnslide
        if (movespeed < 8)
            movespeed = 8
    }
}
