if (vsp < 12)
    vsp += grav
image_speed = 0.35
if place_meeting(x, y, obj_water2)
    vsp = 0
if (flash && alarm[1] <= 0)
    alarm[1] = 0.15 * room_speed
if stun
{
    hsp = 0
    movespeed = 0
    attack = false
    if (stunned > 0)
        stunned--
    else
        stun = false
}
else if attack
{
    hsp = 0
    sprite_index = spr_piraneappleattack
}
else
{
    movespeed = 2
    hsp = image_xscale * movespeed
    if place_meeting((x + image_xscale), y, obj_solid)
        image_xscale *= -1
    sprite_index = spr_piraneapple
}
perform_collisions()
