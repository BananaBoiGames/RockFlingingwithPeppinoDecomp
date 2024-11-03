if (obj_player.state == states.gameover)
    return;
draw_set_font(global.smallfont)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_text(textx, texty, text)
if (room == rm_title || room == rm_init || room == rm_result_rank || room == rm_result_timesup)
    return;
if instance_exists(obj_worldpep)
    return;
draw_set_halign(fa_left)
draw_sprite(player_spr, -1, 120, 80)
draw_sprite(speedbar_spr, speedbar_index, 120, 120)
if (obj_player.alarm[9] > 0)
    draw_sprite(spr_pizzaHUD, (obj_player.alarm[9] / 11), 190, 50)
if (obj_player.combo >= 2)
    draw_sprite(spr_multiplier, clamp((obj_player.combo - 2), 0, 2), 190, 85)
draw_set_font(global.bigfont)
draw_sprite(collect_spr, -1, 810, 30)
draw_text(845, 30, string_hash_to_newline(global.collect))
draw_sprite_ext(spr_pizzacoin, -1, 640, 46, 1, 1, 0, c_white, pizzacoin_alpha)
draw_text_color(659, 30, string_hash_to_newline(global.pizzacoins), c_white, c_white, c_white, c_white, pizzacoin_alpha)
if (global.key_inv == 1)
    draw_sprite(spr_key, -1, 50, 30)
draw_sprite(spr_inv, -1, 50, 30)
draw_set_halign(fa_center)
if (timestop == 0)
{
    if (global.seconds < 10)
    {
        if (global.minutes < 1)
            draw_set_color(c_red)
        else
            draw_set_color(c_white)
        draw_text(480, 65, string_hash_to_newline(string(global.minutes) + ":0" + string(global.seconds)))
    }
    else if (global.seconds >= 10)
    {
        if (global.minutes < 1)
            draw_set_color(c_red)
        else
            draw_set_color(c_white)
        draw_text(480, 65, string_hash_to_newline(string(global.minutes) + ":" + string(global.seconds)))
    }
}
