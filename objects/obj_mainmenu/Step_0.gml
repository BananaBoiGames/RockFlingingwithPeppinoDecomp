if (drop == 1)
    perform_collisions()
if (x > 960 && (!instance_exists(obj_fadeout)))
{
    with (obj_player)
    {
        targetDoor = "A"
        targetRoom = rm_testhub
    }
    instance_create(x, y, obj_fadeout)
}
cursor_index += 0.35
cursor_y = lerp(cursor_y, menuselection, 0.25)
input_get()
if (menu_buffer > 0)
    menu_buffer--
else if (!start)
{
    switch state
    {
        case states.normal:
            move = keyUp.pressed - keyDown.pressed
            if (move != 0)
                menuselection -= move
            menuselection = clamp(menuselection, 0, (array_length(menu_arr) - 1))
            if keyJump.pressed
            {
                sound_play(sfx_confirm)
                menu_buffer = 5
                self.menu_arr[menuselection][1]()
            }
            break
        case states.menu:
            move = keyUp.pressed - keyDown.pressed
            if (move != 0)
                menuselection -= move
            menuselection = clamp(menuselection, 0, (array_length(levelselect_arr) - 1))
            if (keyJump.pressed && (!instance_exists(obj_fadeout)))
            {
                with (obj_player)
                {
                    targetDoor = "A"
                    targetRoom = other.levelselect_arr[other.menuselection][0]
                    image_index = 0
                    state = states.normal
                }
                instance_create(x, y, obj_fadeout)
            }
            break
        case states.gottreasure:
            move = keyLeft.pressed + keyRight.pressed
            if (move != 0)
                menuselection += move
            menuselection = clamp(menuselection, 0, 1)
            if keyJump.pressed
            {
                sound_play(sfx_bump)
                menu_buffer = 5
                if (menuselection == 0)
                    game_end()
                else if (menuselection == 1)
                {
                    state = states.normal
                    menuselection = 0
                }
            }
            break
    }

}
if (sprite_index == spr_pepcooter && (!instance_exists(obj_superdashcloud)))
    instance_create((x - 100), y, obj_superdashcloud)
