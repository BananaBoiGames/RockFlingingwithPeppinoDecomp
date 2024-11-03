if instance_exists(obj_chasingmonsterdark)
{
    x = obj_chasingmonsterdark.x
    y = obj_chasingmonsterdark.y
    image_xscale = obj_chasingmonsterdark.image_xscale
    if instance_exists(obj_light)
    {
        if (color_get_value(obj_chasingmonsterdark.image_blend) > 5)
        {
            if (image_alpha > 0)
                image_alpha -= 0.2
        }
        else if (image_alpha < 1)
            image_alpha += 0.2
    }
}
