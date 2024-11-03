if ((!(place_meeting(x, y, obj_barrel))) && (!instance_exists(obj_barrel)) && (!(point_in_camera(x, y, view_camera[0], 50))) && (!instance_exists(obj_barrelfloat)))
    instance_create(x, y, obj_barrel)
