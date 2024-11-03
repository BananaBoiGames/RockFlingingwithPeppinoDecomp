// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
items = [
{
    name: "ENHANCED MACH 3",
    cost: 15,
    upgrade: "upgrade_mach4"
}
, 
{
    name: "SUPER JUMP ABILITY",
    cost: 30,
    upgrade: "upgrade_sjump"
}
, 
{
    name: "MACH CHARGE",
    cost: 25,
    upgrade: "upgrade_charge"
}
, 
{
    name: "WALL CLIMB ABILITY",
    cost: 40,
    upgrade: "upgrade_climbwall"
}
, 
{
    name: "TOPPING MAGNET",
    cost: 10,
    upgrade: "upgrade_magnet"
}
, 
{
    name: "BODY SLAM",
    cost: 30,
    upgrade: "upgrade_bodyslam"
}
]
function is_item_bought(argument0) //is_item_bought_gml_Object_obj_shop_Create_0
{
    return variable_global_get(argument0);
}

selected = 0
