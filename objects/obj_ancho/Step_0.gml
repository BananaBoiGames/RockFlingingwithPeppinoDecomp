image_speed = 0.35
hsp = 0
vsp = 0
if (bounce == 0)
    sprite_index = spr_ancho
if (bounce == 1)
{
    hsp = 0
    sprite_index = spr_anchobounce
    if (floor(image_index) == (image_number - 1))
        bounce = 0
}
perform_enemy_collisions()
