depth = -1
surf = -1
vertex_format_begin()
vertex_format_add_position()
vertex_format_add_color()
VertexFormat = vertex_format_end()
VBuffer = vertex_create_buffer()
lightposradius = shader_get_uniform(shd_lighting, "u_fLightPositionRadius")
iswhite = shader_get_uniform(shd_lighting, "u_fIsWhite")
