if (fadealpha > 1)
{
    fadein = 1
    if instance_exists(obj_player)
    {
        if (room != obj_player.targetRoom)
            room_goto(obj_player.targetRoom)
    }
    else
        room_goto(gotonoplayer)
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
with (obj_player)
{
    if (other.fadein == 1 && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_exitgate)))
    {
        state = states.comingoutdoor
        image_index = 0
    }
}
if (fadein == 1 && fadealpha < 0)
    instance_destroy()
