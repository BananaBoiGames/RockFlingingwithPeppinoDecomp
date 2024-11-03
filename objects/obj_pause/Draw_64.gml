draw_set_color(c_white)
draw_set_alpha(1)
draw_set_font(global.bigfont)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
pause_image_draw()
draw_set_alpha(bgAlpha)
draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)
draw_set_alpha(collectAlpha)
draw_sprite(collectSpr, -1, 40, 50)
draw_text(75, 50, string_hash_to_newline(global.collect))
draw_set_alpha(1)
draw_set_halign(fa_right)
draw_sprite(spr_pauseBG, 0, bgX, bgY)
for (i = 0; i < array_length(pause_menu); i++)
{
    var c = c_gray
    if (selection == i)
        c = c_white
    draw_sprite_stretched(spr_pauseButton, 0, (menuX - 20 - string_width(pause_menu[i][0])), (menuY - 10 + i * 80), (string_width(pause_menu[i][0]) + 40), sprite_get_height(spr_pauseButton))
    draw_text_color(menuX, (menuY + i * 80), pause_menu[i][0], c, c, c, c, 1)
}
