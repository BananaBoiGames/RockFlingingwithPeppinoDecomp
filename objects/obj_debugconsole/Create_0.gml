//// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
//depth = -500
//DEBUG = false
//if (parameter_count() > 2)
//    DEBUG = true
//if (!DEBUG)
//{
//    var n = parameter_count()
//    for (var i = 0; i < n; i++)
//    {
//        var s = parameter_string(i)
//        if (s == "-debug" || s == "debug")
//            DEBUG = true
//    }
//}
//if (!DEBUG)
//    instance_destroy()
//if DEBUG
//{
//    active = false
//    showoverlay = false
//    SHOW_DEBUG_OVERLAY = new DebugCommand("show_debug_overlay", "Toggles debug overlay", "", function() //anon_gml_Object_obj_debugconsole_Create_0_532_gml_Object_obj_debugconsole_Create_0
//    {
//        show_debug_overlay((!showoverlay))
//        showoverlay = (!showoverlay)
//    }
//)
//    PANIC = new DebugCommand("panic", "Toggles pizza time", "<minutes> <seconds>", function(argument0, argument1) //anon_gml_Object_obj_debugconsole_Create_0_700_gml_Object_obj_debugconsole_Create_0
//    {
//        if (argument0 != undefined && argument0 != "")
//            argument0 = self.get_number_string(argument0)
//        else
//            argument0 = rm_worldmap
//        if (argument1 != undefined && argument1 != "")
//            argument1 = self.get_number_string(argument1)
//        else
//            argument1 = 30
//        global.panic = (!global.panic)
//        global.minutes = argument0
//        global.seconds = argument1
//        if global.panic
//            obj_camera.alarm[1] = 60
//    }
//)
//    SHOW_COLLISIONS = new DebugCommand("showcollisions", "Shows the collisions", "<bool>", function(argument0) //anon_gml_Object_obj_debugconsole_Create_0_1224_gml_Object_obj_debugconsole_Create_0
//    {
//        if (argument0 == undefined)
//            return;
//        argument0 = self.get_bool(argument0)
//        if (argument0 != undefined)
//        {
//            showcollisions = argument0
//            event_perform(ev_other, ev_room_start)
//        }
//    }
//)
//    PLAYER_ROOM = new DebugCommand("player_room", "Go to given room", "<targetRoom> <targetDoor>", function(argument0, argument1) //anon_gml_Object_obj_debugconsole_Create_0_1542_gml_Object_obj_debugconsole_Create_0
//    {
//        if (argument0 == undefined)
//            return;
//        if (argument1 == undefined)
//            return;
//        argument0 = asset_get_index(argument0)
//        if (argument0 == -1)
//            return;
//        with (obj_player)
//        {
//            targetRoom = argument0
//            targetDoor = argument1
//        }
//        instance_create(x, y, obj_fadeout)
//    }
//)
//    MUSIC_DISABLE = new DebugCommand("music_disable", "Disable all music", "", function() //anon_gml_Object_obj_debugconsole_Create_0_1941_gml_Object_obj_debugconsole_Create_0
//    {
//        if instance_exists(obj_music)
//        {
//            with (obj_music)
//            {
//                audio_stop_sound(musicID)
//                audio_stop_sound(bonusmusicID)
//                musicID = -4
//                bonusmusicID = -4
//                instance_destroy()
//            }
//        }
//    }
//)
//    active = false
//    showcollisions = true
//    command_list = ds_list_create()
//    ds_list_add(command_list, SHOW_COLLISIONS, PLAYER_ROOM, PANIC, SHOW_DEBUG_OVERLAY, MUSIC_DISABLE)
//    input_text = ""
//    text_list = ds_list_create()
//    search_commands = ds_list_create()
//    search_commandlist = ds_list_create()
//    ds_list_clear(search_commands)
//    ds_list_clear(search_commandlist)
//    search_selection = -1
//    search_selecting = false
//    keyboard_string = ""
//    function FindCommand(argument0) //FindCommand_gml_Object_obj_debugconsole_Create_0
//    {
//        for (var i = 0; i < ds_list_size(command_list); i++)
//        {
//            var b = ds_list_find_value(command_list, i)
//            if (b.command_id == argument0)
//                return b;
//        }
//        return undefined;
//    }

//    function DoCommand(argument0) //DoCommand_gml_Object_obj_debugconsole_Create_0
//    {
//        var commands = _string_split(argument0, " ")
//        if (array_length(commands) > 1)
//        {
//            var c = self.FindCommand(commands[1])
//            if (c != undefined)
//            {
//                debug_textlist_add(1, argument0)
//                array_delete(commands, 0, 2)
//                c.Invoke(commands)
//                return true;
//            }
//            else
//            {
//                debug_textlist_add(0, argument0)
//                debug_textlist_add(3, "Invalid command")
//            }
//        }
//        else
//        {
//            debug_textlist_add(0, argument0)
//            debug_textlist_add(3, "No text typed")
//        }
//        return false;
//    }

//    function GetDouble(argument0) //GetDouble_gml_Object_obj_debugconsole_Create_0
//    {
//        var n = string_digits(argument0)
//        if (n != undefined && n != "")
//        {
//            n = real(argument0)
//            return n;
//        }
//        return undefined;
//    }

//    function get_bool(argument0) //get_bool_gml_Object_obj_debugconsole_Create_0
//    {
//        if (argument0 == "true")
//        {
//            argument0 = true
//            return argument0;
//        }
//        else if (argument0 == "false")
//        {
//            argument0 = false
//            return argument0;
//        }
//        else if is_real(real(string_digits(argument0)))
//        {
//            argument0 = bool(real(string_digits(argument0)))
//            return argument0;
//        }
//        return undefined;
//    }

//    function get_number_string(argument0) //get_number_string_gml_Object_obj_debugconsole_Create_0
//    {
//        var n = argument0
//        if is_string(argument0)
//        {
//            n = real(string_digits(argument0))
//            if (string_char_at(argument0, 1) == "-")
//                n = (-real(string_digits(argument0)))
//        }
//        return n;
//    }

//}
var n, i, s;

depth = -500;
DEBUG = false;

//if (parameter_count() > 2)
    //DEBUG = true;

if (!DEBUG)
{
    n = parameter_count();
    
    for (i = 0; i < n; i++)
    {
        s = parameter_string(i);
        
        if (s == "-debug" || s == "debug")
            DEBUG = true;
    }
}

if (!DEBUG)
    instance_destroy();

if (DEBUG)
{
    active = false;
    showoverlay = false;
    SHOW_DEBUG_OVERLAY = new DebugCommand("show_debug_overlay", "Toggles debug overlay", "", function()
    {
        show_debug_overlay(!showoverlay);
        showoverlay = !showoverlay;
    });
    PANIC = new DebugCommand("panic", "Toggles pizza time", "<minutes> <seconds>", function(argument0, argument1)
    {
        if (argument0 != undefined && argument0 != "")
            argument0 = get_number_string(argument0);
        else
            argument0 = 3;
        
        if (argument1 != undefined && argument1 != "")
            argument1 = get_number_string(argument1);
        else
            argument1 = 30;
        
        global.panic = !global.panic;
        global.minutes = argument0;
        global.seconds = argument1;
        
        if (global.panic)
            obj_camera.alarm[1] = 60;
    });
    SHOW_COLLISIONS = new DebugCommand("showcollisions", "Shows the collisions", "<bool>", function(argument0)
    {
        if (argument0 == undefined)
            exit;
        
        argument0 = get_bool(argument0);
        
        if (argument0 != undefined)
        {
            showcollisions = argument0;
            event_perform(ev_other, ev_room_start);
        }
    });
    PLAYER_ROOM = new DebugCommand("player_room", "Go to given room", "<targetRoom> <targetDoor>", function(argument0, argument1)
    {
        if (argument0 == undefined)
            exit;
        
        if (argument1 == undefined)
            exit;
        
        argument0 = asset_get_index(argument0);
        
        if (argument0 == -1)
            exit;
        
        with (obj_player)
        {
            targetRoom = argument0;
            targetDoor = argument1;
        }
        
        instance_create(x, y, obj_fadeout);
    });
    MUSIC_DISABLE = new DebugCommand("music_disable", "Disable all music", "", function()
    {
        if (instance_exists(obj_music))
        {
            with (obj_music)
            {
                audio_stop_sound(musicID);
                audio_stop_sound(bonusmusicID);
                musicID = -4;
                bonusmusicID = -4;
                instance_destroy();
            }
        }
    });
    active = false;
    showcollisions = true;
    command_list = ds_list_create();
    ds_list_add(command_list, SHOW_COLLISIONS, PLAYER_ROOM, PANIC, SHOW_DEBUG_OVERLAY, MUSIC_DISABLE);
    input_text = "";
    text_list = ds_list_create();
    search_commands = ds_list_create();
    search_commandlist = ds_list_create();
    ds_list_clear(search_commands);
    ds_list_clear(search_commandlist);
    search_selection = -1;
    search_selecting = false;
    keyboard_string = "";
    
    function FindCommand(argument0)
    {
        var i, b;
        
        for (i = 0; i < ds_list_size(command_list); i++)
        {
            b = ds_list_find_value(command_list, i);
            
            if (b.command_id == argument0)
                return b;
        }
        
        return undefined;
    }
    
    function DoCommand(argument0)
    {
        var commands, c;
        
        commands = _string_split(argument0, " ");
        
        if (array_length(commands) > 1)
        {
            c = FindCommand(commands[1]);
            
            if (c != undefined)
            {
                debug_textlist_add(1, argument0);
                array_delete(commands, 0, 2);
                c.Invoke(commands);
                return true;
            }
            else
            {
                debug_textlist_add(0, argument0);
                debug_textlist_add(3, "Invalid command");
            }
        }
        else
        {
            debug_textlist_add(0, argument0);
            debug_textlist_add(3, "No text typed");
        }
        
        return false;
    }
    
    function GetDouble(argument0)
    {
        var n;
        
        n = string_digits(argument0);
        
        if (n != undefined && n != "")
        {
            n = real(argument0);
            return n;
        }
        
        return undefined;
    }
    
    function get_bool(argument0)
    {
        if (argument0 == "true")
        {
            argument0 = true;
            return argument0;
        }
        else if (argument0 == "false")
        {
            argument0 = false;
            return argument0;
        }
        else if (is_real(real(string_digits(argument0))))
        {
            argument0 = bool(real(string_digits(argument0)));
            return argument0;
        }
        
        return undefined;
    }
    
    function get_number_string(argument0)
    {
        var n;
        
        n = argument0;
        
        if (is_string(argument0))
        {
            n = real(string_digits(argument0));
            
            if (string_char_at(argument0, 1) == "-")
                n = -real(string_digits(argument0));
        }
        
        return n;
    }
}
