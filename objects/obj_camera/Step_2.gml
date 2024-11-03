var playermach = obj_player.mach2
var playerstate = obj_player.state
var playerspr = obj_player.sprite_index
speedbar_spr = spr_speedbar
speedbar_index = 0
if (playermach < 7)
    speedbar_index = 0
else if (playermach >= 7 && playermach < 35)
    speedbar_index = 1
else if (playermach >= 35 && playermach < 50)
    speedbar_index = 2
else if (playermach >= 50 && playermach < 75)
    speedbar_index = 3
else if (playermach >= 75 && playermach < 100)
    speedbar_index = 4
else if (playermach >= 100)
{
    speedbar_spr = spr_speedbarmax
    speedbar_index = -1
}
player_spr = spr_pepinoHUD
switch playerspr
{
    case spr_player_victory:
        player_spr = spr_pepinoHUDhappy
        break
    case spr_player_machslideboost:
        player_spr = spr_pepinoHUDmach2
        break
    case spr_player_machslideboost3:
        player_spr = spr_pepinoHUDmach3
        break
}

if (player_spr == spr_pepinoHUD)
{
    switch playerstate
    {
        case (32 << 0):
            player_spr = spr_pepinoHUDstun
            break
        case (56 << 0):
            if (shake_mag > 0)
                player_spr = spr_pepinoHUDstun
            break
        case (48 << 0):
        case (20 << 0):
        case (15 << 0):
        case (55 << 0):
        case (33 << 0):
        case (18 << 0):
        case (37 << 0):
        case (43 << 0):
        case (44 << 0):
        case (9 << 0):
        case (23 << 0):
            player_spr = spr_pepinoHUDmach1
            break
        case (49 << 0):
        case (51 << 0):
        case (10 << 0):
            player_spr = spr_pepinoHUDmach2
            break
        case (50 << 0):
            player_spr = spr_pepinoHUDmach3
            break
        case (54 << 0):
        case (17 << 0):
            player_spr = spr_pepinoHUDhurt
            break
        case (41 << 0):
        case (36 << 0):
        case (29 << 0):
            player_spr = spr_pepinoHUDhappy
            break
    }

}
