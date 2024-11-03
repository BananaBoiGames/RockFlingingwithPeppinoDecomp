//with (obj_player)
//{
//    if (keyUp.held && ladderbuffer == 0 && (state == states.normal || state == states.shotgunjump || state == states.highjump) && state != states.hurt && state != states.mach1 && state != states.mach2 && state != states.machslide && state != states.freefall && state != states.freefallland)
//    {
//        state = states.ladder
//        x = other.x + 16
//        y = floor(y)
//        if ((y % 2) == 1)
//            y -= 1
//    }
//}
with (obj_player)
{
    if (keyUp.held && ladderbuffer == 0 /*&& (state == states.normal || state == states.shotgunjump || state == states.highjump) && state != states.hurt && state != states.mach1 && state != states.mach2 && state != states.machslide && state != states.freefall && state != states.freefallland*/)
    {
        state = states.ladder;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
}
