with (obj_player)
{
    if (room == rm_result_rank)
    {
        obj_player.x = 480
        obj_player.y = 270
    }
}
if (fadealpha > 1)
{
    fadein = 1
    if (room != rm_result_rank)
    {
        sound_play(mu_victory)
        room = rm_result_rank
    }
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
