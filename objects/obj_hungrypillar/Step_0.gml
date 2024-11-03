if (obj_player.state == states.pizzathrow && pillarhunger > 0)
{
    if (framereset == 0)
    {
        image_index = 0
        framereset = 1
    }
    sprite_index = spr_hungrypillar_mouth
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
}
else
{
    framereset = 0
    sprite_index = spr_hungrypillar
    image_speed = 0.35
}
if (global.minutes <= 2 && (!(obj_player.state == states.pizzathrow)) && pillarhunger > 0)
{
    sprite_index = spr_hungrypillar_angry
    image_speed = 0.35
}
if (pillarhunger == 0)
{
    sprite_index = spr_hungrypillar_happy
    image_speed = 0.35
}
if (timeadded > 0)
{
    global.seconds += 1
    timeadded -= 0.2
}
