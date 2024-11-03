// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
image_speed = 0.35
hsp = 0
vsp = 0
grav = 0.5
grounded = false
drop = false
start = false
state = states.normal
cursor_index = 0
cursor_y = 0
menuselection = 0
menu_buffer = 0
function start_game() //start_game_gml_Object_obj_mainmenu_Create_0
{
    state = states.menu
    menuselection = 0
}

function quit() //quit_gml_Object_obj_mainmenu_Create_0
{
    state = states.gottreasure
    menuselection = 1
}

menu_arr = [["START", start_game_gml_Object_obj_mainmenu_Create_0], ["QUIT", quit_gml_Object_obj_mainmenu_Create_0]]
levelselect_arr = [[12, "TOWER"], [69, "HYDRO"], [79, "FLING"], [65, "DESERT"]]
