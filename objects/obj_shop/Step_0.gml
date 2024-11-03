input_get()
move = keyUp.pressed - keyDown.pressed
if (move != 0)
    selected -= move
selected = clamp(selected, 0, (array_length(items) - 1))
var selecteditem = items[selected]
if (keyJump.pressed && (!self.is_item_bought(selecteditem.upgrade)) && global.pizzacoins >= selecteditem.cost)
{
    global.pizzacoins -= selecteditem.cost
    variable_global_set(selecteditem.upgrade, true)
}
if keySlap.pressed
    instance_destroy()
