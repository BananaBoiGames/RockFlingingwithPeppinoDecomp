with (obj_player)
{
    if (other.drop == 0)
    {
        if (state == states.barrelmach1 || state == states.barrelmach2)
        {
            image_index = 0
            other.drop = 1
            state = states.barrelslipnslide
            if (movespeed < 8)
                movespeed = 8
        }
        else if (state == states.machroll)
            other.drop = 1
        else
        {
            other.drop = 1
            state = states.slipnslide
            if (movespeed < 8)
                movespeed = 8
        }
    }
}
