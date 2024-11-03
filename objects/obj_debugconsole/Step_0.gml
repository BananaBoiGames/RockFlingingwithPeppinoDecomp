//if DEBUG
//{
//    if keyboard_check_pressed(vk_f5)
//    {
//        active = (!active)
//        keyboard_string = ""
//    }
//    if keyboard_check_pressed(vk_f4)
//    {
//        showcollisions = (!showcollisions)
//        event_perform(ev_other, ev_room_start)
//    }
//    if active
//    {
//        if (!search_selecting)
//        {
//            var _search = false
//            if keyboard_check(vk_anykey)
//            {
//                input_text += keyboard_string
//                for (var i = 0; i < string_length(keyboard_string); i++)
//                {
//                    var b = string_char_at(keyboard_string, (i + 1))
//                    var d = string_upper(b)
//                    if (d == "")
//                        d = string_lettersdigits(b)
//                    keyboard_key_release(ord(d))
//                }
//                keyboard_string = ""
//                _search = true
//            }
//            if keyboard_check(vk_backspace)
//            {
//                input_text = string_delete(input_text, string_length(input_text), 1)
//                keyboard_key_release(vk_backspace)
//                _search = true
//            }
//            if keyboard_check_pressed(vk_return)
//            {
//                self.DoCommand(input_text)
//                input_text = ""
//                keyboard_string = ""
//                _search = true
//                active = false
//            }
//            if ((!ds_list_empty(search_commandlist)) && keyboard_check_pressed(vk_tab) && string_pos(ds_list_find_value(search_commandlist, 0), input_text) == 0)
//            {
//                keyboard_string = ""
//                input_text = ds_list_find_value(search_commandlist, 0)
//            }
//            if _search
//            {
//                ds_list_clear(search_commands)
//                ds_list_clear(search_commandlist)
//                for (i = 0; i < ds_list_size(command_list); i++)
//                {
//                    b = ds_list_find_value(command_list, i)
//                    var s = b.command_id
//                    d = _string_split(input_text, " ")
//                    var t = d[1]
//                    if (string_copy(s, 1, string_length(t)) == t)
//                    {
//                        var txt = concat(b.command_id, " ", b.format, " - ", b.description)
//                        ds_list_add(search_commands, txt)
//                        ds_list_add(search_commandlist, b.command_id)
//                    }
//                }
//            }
//        }
//        if (!ds_list_empty(search_commandlist))
//        {
//            if keyboard_check_pressed(vk_down)
//            {
//                search_selecting = true
//                search_selection++
//                if (search_selection > (ds_list_size(search_commandlist) - 1))
//                    search_selection = 0
//                keyboard_string = ""
//                input_text = ds_list_find_value(search_commandlist, search_selection)
//            }
//            if keyboard_check_pressed(vk_up)
//            {
//                search_selecting = true
//                search_selection--
//                if (search_selection < 0)
//                    search_selection = ds_list_size(search_commandlist) - 1
//                keyboard_string = ""
//                input_text = ds_list_find_value(search_commandlist, search_selection)
//            }
//            if ((keyboard_check_pressed(vk_return) || keyboard_check_pressed(vk_escape)) && search_selecting)
//            {
//                keyboard_string = ""
//                search_selecting = false
//                search_selection = -1
//            }
//        }
//    }
//}
var _search, i, b, d, s, t, txt;

if (DEBUG)
{
    if (keyboard_check_pressed(vk_f5))
    {
        active = !active;
        keyboard_string = "";
    }
    
    if (keyboard_check_pressed(vk_f4))
    {
        showcollisions = !showcollisions;
        event_perform(ev_other, ev_room_start);
    }
    
    if (active)
    {
        if (!search_selecting)
        {
            _search = false;
            
            if (keyboard_check(vk_anykey))
            {
                input_text += keyboard_string;
                
                for (i = 0; i < string_length(keyboard_string); i++)
                {
                    b = string_char_at(keyboard_string, i + 1);
                    d = string_upper(b);
                    
                    if (d == "")
                        d = string_lettersdigits(b);
                    
                    keyboard_key_release(ord(d));
                }
                
                keyboard_string = "";
                _search = true;
            }
            
            if (keyboard_check(vk_backspace))
            {
                input_text = string_delete(input_text, string_length(input_text), 1);
                keyboard_key_release(vk_backspace);
                _search = true;
            }
            
            if (keyboard_check_pressed(vk_enter))
            {
                DoCommand(input_text);
                input_text = "";
                keyboard_string = "";
                _search = true;
                active = false;
            }
            
            if (!ds_list_empty(search_commandlist) && keyboard_check_pressed(vk_tab) && string_pos(ds_list_find_value(search_commandlist, 0), input_text) == 0)
            {
                keyboard_string = "";
                input_text = ds_list_find_value(search_commandlist, 0);
            }
            
            if (_search)
            {
                ds_list_clear(search_commands);
                ds_list_clear(search_commandlist);
                
                for (i = 0; i < ds_list_size(command_list); i++)
                {
                    b = ds_list_find_value(command_list, i);
                    s = b.command_id;
                    d = _string_split(input_text, " ");
                    t = d[1];
                    
                    if (string_copy(s, 1, string_length(t)) == t)
                    {
                        txt = concat(b.command_id, " ", b.format, " - ", b.description);
                        ds_list_add(search_commands, txt);
                        ds_list_add(search_commandlist, b.command_id);
                    }
                }
            }
        }
        
        if (!ds_list_empty(search_commandlist))
        {
            if (keyboard_check_pressed(vk_down))
            {
                search_selecting = true;
                search_selection++;
                
                if (search_selection > (ds_list_size(search_commandlist) - 1))
                    search_selection = 0;
                
                keyboard_string = "";
                input_text = ds_list_find_value(search_commandlist, search_selection);
            }
            
            if (keyboard_check_pressed(vk_up))
            {
                search_selecting = true;
                search_selection--;
                
                if (search_selection < 0)
                    search_selection = ds_list_size(search_commandlist) - 1;
                
                keyboard_string = "";
                input_text = ds_list_find_value(search_commandlist, search_selection);
            }
            
            if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape)) && search_selecting)
            {
                keyboard_string = "";
                search_selecting = false;
                search_selection = -1;
            }
        }
    }
}
