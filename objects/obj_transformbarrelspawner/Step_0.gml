if ((!(place_meeting(x, y, obj_transformbarrel))) && (!instance_exists(barrelid)) && (!(place_meeting(x, y, obj_player))) && obj_player.barrel == 0)
{
    instance_create(x, y, obj_genericpoof)
    barrelid = instance_create(x, y, obj_transformbarrel)
}
