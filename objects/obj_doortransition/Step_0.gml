if (image_xscale < 60)
{
    image_xscale += 1
    image_yscale += 1
}
else
{
    if (room != obj_player.targetRoom)
        room_goto(obj_player.targetRoom)
    if (alarm[0] == -1)
        alarm[0] = 5
}
