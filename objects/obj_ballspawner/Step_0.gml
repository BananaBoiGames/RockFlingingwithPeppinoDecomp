if ((!(place_meeting(x, y, obj_ball))) && (!instance_exists(obj_ball)) && (!(point_in_camera(x, y, view_camera[0], 50))))
    instance_create(x, y, obj_ball)
