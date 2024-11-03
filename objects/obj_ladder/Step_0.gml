//if place_meeting(x, (y - 1), obj_player)
//{
//    with (obj_player)
//    {
//        if (place_meeting(x, (y + 1), obj_ladder) && keyDown.held && state == states.crouch && place_meeting(x, (y + 1), obj_platform))
//        {
//            sound_play(sfx_climbdown, true, (1 << 0))
//            y += 5
//            state = states.ladder
//            x = other.x + 16
//            y = floor(y)
//            if ((y % 2) == 1)
//                y -= 1
//        }
//    }
//}
if (place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        if (place_meeting(x, y + 1, obj_ladder) && keyDown.held && state == states.crouch && place_meeting(x, y + 1, obj_platform))
        {
            sound_play(31, true, (1 << 0));
            y += 5;
            state = states.ladder;
            x = other.x + 16;
            y = floor(y);
            
            if ((y % 2) == 1)
                y -= 1;
        }
    }
}
