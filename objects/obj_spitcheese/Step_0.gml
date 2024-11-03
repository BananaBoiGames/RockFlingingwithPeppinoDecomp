event_inherited()
if (throwtimer != 0)
    throwtimer--
if (x != obj_player.x && state != enemystate.enemythrow && throwtimer <= 0)
{
    if (obj_player.x > (x - 300) && obj_player.x < (x + 300))
    {
        if ((state == enemystate.walk || state == enemystate.idle) && grounded)
        {
            image_index = 0
            image_xscale = (-(sign(x - obj_player.x)))
            state = enemystate.enemythrow
        }
    }
}
