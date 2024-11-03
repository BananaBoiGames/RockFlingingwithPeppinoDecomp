function draw_set_blend_mode(argument0) //draw_set_blend_mode
{
    gpu_set_blendmode(argument0)
}

function draw_sprite_grid() //draw_sprite_grid
{
    if (!sprite_exists(sprite_index))
        return;
    for (var i = 0; i < image_xscale; i++)
    {
        for (var j = 0; j < image_yscale; j++)
            draw_sprite_ext(sprite_index, image_index, (x + i * sprite_get_width(sprite_index)), (y + j * sprite_get_height(sprite_index)), 1, 1, image_angle, image_blend, image_alpha)
    }
}

function draw_background_stretched(argument0, argument1, argument2, argument3, argument4) //draw_background_stretched
{
    draw_sprite_stretched(argument0, 0, argument1, argument2, argument3, argument4)
}

function project_shadow(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //project_shadow
{
    var _vb = argument0
    var _Ax = argument1
    var _Ay = argument2
    var _Bx = argument3
    var _By = argument4
    var _Lx = argument5
    var _Ly = argument6
    var SHADOW_LENGTH = 20000
    var Adx = _Ax - _Lx
    var Ady = _Ay - _Ly
    var len = 1 * SHADOW_LENGTH / (sqrt(Adx * Adx + Ady * Ady))
    Adx = _Ax + Adx * len
    Ady = _Ay + Ady * len
    var Bdx = _Bx - _Lx
    var Bdy = _By - _Ly
    len = 1 * SHADOW_LENGTH / (sqrt(Bdx * Bdx + Bdy * Bdy))
    Bdx = _Bx + Bdx * len
    Bdy = _By + Bdy * len
    vertex_position(_vb, _Ax, _Ay)
    vertex_argb(_vb, 4278190080)
    vertex_position(_vb, _Bx, _By)
    vertex_argb(_vb, 4278190080)
    vertex_position(_vb, Adx, Ady)
    vertex_argb(_vb, 4278190080)
    vertex_position(_vb, _Bx, _By)
    vertex_argb(_vb, 4278190080)
    vertex_position(_vb, Adx, Ady)
    vertex_argb(_vb, 4278190080)
    vertex_position(_vb, Bdx, Bdy)
    vertex_argb(_vb, 4278190080)
}

