draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false)
draw_set_font(global.smallfont)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_sprite(spr_pizzacoin, 0, 870, 32)
draw_text(900, 32, string(global.pizzacoins))
for (i = 0; i < array_length(items); i++)
{
    var itemalpha = 0.25
    if self.is_item_bought(items[i].upgrade)
        itemalpha = 0.1
    if (selected == i)
    {
        itemalpha += (self.is_item_bought(items[i].upgrade) ? 0.45 : 0.75)
        draw_sprite(spr_shopselection, 0, wave(790, 800, 1, 0), (95 + 60 * i))
    }
    draw_set_alpha(itemalpha)
    draw_set_font(global.bigfont)
    draw_text(160, (80 + 60 * i), items[i].name)
    draw_set_font(global.smallfont)
    draw_text(160, (110 + 60 * i), ("COST: " + string(items[i].cost)))
    draw_set_alpha(1)
}
