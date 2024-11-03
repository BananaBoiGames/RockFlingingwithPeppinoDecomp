if (global.panic || 0)
{
    var lay_id = layer_get_id("Assets_1")
    var spr_id = layer_sprite_get_id(lay_id, "controlsSpr")
    if layer_sprite_exists(lay_id, spr_id)
        layer_sprite_destroy(spr_id)
}
