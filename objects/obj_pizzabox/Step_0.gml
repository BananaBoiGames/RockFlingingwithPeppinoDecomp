if (throwed == 1)
{
    if (vsp < 12)
        vsp += grav
}
if place_meeting((x + 64), (y - 130), obj_hungrypillar)
{
    obj_hungrypillar.framereset = 0
    obj_hungrypillar.image_speed = 0.35
    obj_hungrypillar.timeadded += inpizzabox
    instance_destroy()
    obj_hungrypillar.pillarhunger = 0
}
x += hsp
y += floor(vsp)
