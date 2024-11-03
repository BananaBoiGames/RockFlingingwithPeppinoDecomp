if drop
{
    perform_enemy_collisions()
    if (place_meeting(x, (y + 1), obj_spike) && (!(place_meeting(x, (y - 16), obj_solid))))
        vsp = -9
    if place_meeting(x, y, obj_current)
        hsp = -15
    if place_meeting(x, y, obj_current2)
        hsp = 15
}
if (grounded && (!(place_meeting(x, y, obj_current))) && (!(place_meeting(x, y, obj_current2))))
    hsp = 0
if (cantcollect == 1)
{
    if (flicker == 0)
    {
        alarm[1] = 3
        flicker = 1
    }
}
else if (cantcollect == 0)
    image_alpha = 1
if (abs(distance_to_object(obj_player)) < 75 && global.upgrade_magnet && (!((drop && (!grounded)))) && point_in_camera(x, y, view_camera[0]) && (!(place_meeting(x, y, obj_destructibles))))
    gotowardsplayer = true
if gotowardsplayer
{
    drop = false
    move_towards_point(obj_player.x, obj_player.y, movespeed)
    movespeed += 0.5
}
