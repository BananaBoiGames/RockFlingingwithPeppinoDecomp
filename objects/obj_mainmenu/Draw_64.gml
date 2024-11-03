if (!start)
{
    draw_set_font(global.bigfont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    switch state
    {
        case states.normal:
            for (i = 0; i < array_length(menu_arr); i++)
                draw_text_color(480, (240 + 32 * i), menu_arr[i][0], c_white, c_white, c_white, c_white, (i == menuselection ? 1 : 0.5))
            draw_sprite(spr_cursor, cursor_index, 380, (256 + 32 * cursor_y))
            break
        case states.menu:
            draw_text_color(480, 300, "PRESS UP AND DOWN TO", c_white, c_white, c_white, c_white, 1)
            draw_text_color(480, 330, "SELECT LEVEL", c_white, c_white, c_white, c_white, 1)
            draw_text_color(480, 240, ((string(menuselection + 1)) + ". " + levelselect_arr[menuselection][1]), c_white, c_white, c_white, c_white, 1)
            draw_sprite(spr_cursor, cursor_index, 330, 256)
            break
        case states.gottreasure:
            draw_set_alpha(0.75)
            draw_set_color(c_black)
            draw_rectangle(0, 0, 960, 540, false)
            draw_set_alpha(1)
            draw_set_color(c_white)
            draw_text(480, 240, "QUIT GAME")
            draw_text_color(300, 270, "YES", c_white, c_white, c_white, c_white, (menuselection == 0 ? 1 : 0.5))
            draw_text_color(660, 270, "NO", c_white, c_white, c_white, c_white, (menuselection == 1 ? 1 : 0.5))
            break
    }

}
