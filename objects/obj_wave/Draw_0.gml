shader_set(shd_wind)
shader_set_uniform_f(uTime, (current_time / 1000))
draw_background_stretched(bg_bonus, 0, 0, room_width, room_height)
shader_reset()
