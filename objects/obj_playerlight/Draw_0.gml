if (!surface_exists(surf))
    surf = surface_create(room_width, room_height)
var lightx = obj_player.x
var lighty = obj_player.y
if (obj_player.mask_index == mask_playercrouch)
    lighty += 25
var lightrad = 280
var tile_size = 32
var tilemap = layer_tilemap_get_id("Tiles_1")
var startx = floor((lightx - lightrad) / tile_size)
var endx = floor((lightx + lightrad) / tile_size)
var starty = floor((lighty - lightrad) / tile_size)
var endy = floor((lighty + lightrad) / tile_size)
surface_set_target(surf)
draw_clear_alpha(c_black, 0)
vertex_begin(VBuffer, VertexFormat)
for (var yy = starty; yy <= endy; yy++)
{
    for (var xx = startx; xx <= endx; xx++)
    {
        var tile = tilemap_get(tilemap, xx, yy)
        if (tile != 0)
        {
            var px1 = xx * tile_size
            var py1 = yy * tile_size
            var px2 = px1 + tile_size
            var py2 = py1 + tile_size
            if (!(sign_test(px1, py1, px2, py1, lightx, lighty)))
                project_shadow(VBuffer, px1, py1, px2, py1, lightx, lighty)
            if (!(sign_test(px2, py1, px2, py2, lightx, lighty)))
                project_shadow(VBuffer, px2, py1, px2, py2, lightx, lighty)
            if (!(sign_test(px2, py2, px1, py2, lightx, lighty)))
                project_shadow(VBuffer, px2, py2, px1, py2, lightx, lighty)
            if (!(sign_test(px1, py2, px1, py1, lightx, lighty)))
                project_shadow(VBuffer, px1, py2, px1, py1, lightx, lighty)
        }
    }
}
vertex_end(VBuffer)
vertex_submit(VBuffer, 4, -1)
surface_reset_target()
shader_set(shd_lighting)
shader_set_uniform_f(lightposradius, lightx, lighty, lightrad, 0)
if (image_blend == c_white)
{
    shader_set_uniform_f(iswhite, true)
    draw_surface(surf, 0, 0)
}
else
{
    shader_set_uniform_f(iswhite, false)
    draw_surface_ext(surf, 0, 0, 1, 1, 0, image_blend, 1)
}
shader_reset()
