if ((!(place_meeting(x, y, obj_boulder))) && (!instance_exists(obj_boulder)) && (!(point_in_camera(x, y, view_camera[0], 50))))
    instance_create(x, y, obj_boulder)
