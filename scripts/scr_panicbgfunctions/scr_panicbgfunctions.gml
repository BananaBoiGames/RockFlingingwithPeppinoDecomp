function panicbg_start() //panicbg_start
{
    if (instance_exists(obj_pause) && obj_pause.pause)
        return;
    if ((!variable_global_exists("panicbg_surface")) || (!surface_exists(global.panicbg_surface)))
        global.panicbg_surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
    surface_resize(global.panicbg_surface, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
    if (event_type == 8 && event_number == 0)
    {
        surface_set_target(global.panicbg_surface)
        draw_clear_alpha(c_black, 0)
        var a = layer_get_all()
        for (var i = 0; i < array_length(a); i++)
        {
            var _cam_x = camera_get_view_x(view_camera[0])
            var _cam_y = camera_get_view_y(view_camera[0])
            if (string_copy(layer_get_name(a[i]), 1, 12) == "Backgrounds_")
            {
                layer_x(a[i], (layer_get_x(a[i]) - abs(_cam_x)))
                layer_y(a[i], (layer_get_y(a[i]) - abs(_cam_y)))
            }
        }
    }
}

function panicbg_end() //panicbg_end
{
    if (instance_exists(obj_pause) && obj_pause.pause)
        return;
    if variable_global_exists("panicbg_surface")
    {
        if surface_exists(global.panicbg_surface)
        {
            if (event_type == 8 && event_number == 0)
            {
                surface_reset_target()
                shader_set(shd_panicbg)
                var panic_id = shader_get_uniform(shd_panicbg, "panic")
                shader_set_uniform_f(panic_id, (global.wave / global.maxwave))
                var time_id = shader_get_uniform(shd_panicbg, "time")
                shader_set_uniform_f(time_id, (current_time / 1000))
                with (obj_parallax)
                    event_perform(ev_step, ev_step_normal)
                draw_surface(global.panicbg_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]))
                shader_reset()
            }
        }
    }
}

