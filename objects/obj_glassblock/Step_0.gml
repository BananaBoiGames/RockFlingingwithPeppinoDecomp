if (place_meeting((x + 1), y, obj_player) && obj_player.xscale == -1 && obj_player.mach2 >= 35 && obj_player.attacking == 1)
{
    if (obj_player.machpunchAnim == 0 && obj_player.state == states.mach2)
    {
        with (obj_player)
        {
            if place_meeting(x, (y + 1), obj_collisionparent)
            {
                machpunchAnim = 1
                image_index = 0
            }
        }
    }
    instance_destroy()
}
if (place_meeting((x - 1), y, obj_player) && obj_player.xscale == 1 && obj_player.mach2 >= 35 && obj_player.attacking == 1)
{
    if (obj_player.machpunchAnim == 0 && obj_player.state == states.mach2)
    {
        with (obj_player)
        {
            if place_meeting(x, (y + 1), obj_collisionparent)
            {
                machpunchAnim = 1
                image_index = 0
            }
        }
    }
    instance_destroy()
}
if (place_meeting(x, (y - 1), obj_player) && obj_player.vsp > 0 && obj_player.state == states.facestomp)
{
    instance_destroy()
    obj_player.image_index = 0
    obj_player.sprite_index = spr_player_facestomphit
    obj_player.vsp = -7
}
if (place_meeting(x, (y - 1), obj_player) && obj_player.vsp > 0 && (obj_player.state == states.freefall || obj_player.state == states.superslam || obj_player.state == states.knightpep))
    instance_destroy()
if (place_meeting(x, (y + 1), obj_player) && obj_player.state == states.Sjump)
    instance_destroy()
if place_meeting(x, (y + 1), obj_player)
{
    with (obj_player)
    {
        if (keyJump.pressed && state == states.crouch)
        {
            instance_destroy(other.id)
            vsp = 0
            jumpstop = 1
        }
    }
}
if (place_meeting(x, (y + 1), obj_player) && obj_player.vsp <= 0.5)
{
    with (obj_player)
    {
        if (!(place_meeting(x, (y + 1), obj_collisionparent)))
        {
            instance_destroy(other.id)
            vsp = 0
            jumpstop = 1
        }
    }
}
