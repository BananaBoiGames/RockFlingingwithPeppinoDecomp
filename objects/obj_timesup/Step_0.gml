if (!(place_meeting(x, (y + 1), obj_collisionparent)))
    image_speed = 0
else if (floor(image_index) != (image_number - 1))
    image_speed = 0.35
else
    image_speed = 0
perform_collisions()
