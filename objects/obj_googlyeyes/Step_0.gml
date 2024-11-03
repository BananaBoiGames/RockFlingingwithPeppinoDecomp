x = obj_player.x
if (obj_player.state == states.crouch || obj_player.state == states.crouchjump || obj_player.state == states.crouchslide)
    y = obj_player.y + 25
else
    y = obj_player.y
image_xscale = obj_player.xscale
if instance_exists(obj_light)
{
    if (color_get_value(obj_player.image_blend) > 5)
    {
        if (image_alpha > 0)
            image_alpha -= 0.2
    }
    else if (image_alpha < 1)
        image_alpha += 0.2
}
image_speed = 0.35
if (obj_player.state == states.hurt)
    sprite_index = spr_googlyeyeshurt
else if (obj_player.hsp != 0)
    sprite_index = spr_googlyeyesmove
else
    sprite_index = spr_googlyeyes
