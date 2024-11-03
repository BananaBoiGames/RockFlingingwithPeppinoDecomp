player = other.object_index
if (start == 1)
{
    if (player.state != (28 << 0))
    {
        player.visible = false
        storedstate = player.state
        storedmovespeed = player.movespeed
        storedgrav = player.grav
        storedimageindex = player.image_index
        storedspriteindex = player.sprite_index
        alarm[0] = 25
        player.hsp = 0
        player.vsp = 0
        player.grav = 0
        player.alarm[7] = 50
        player.alarm[5] = 2
        player.hurted = 1
        player.state = (28 << 0)
    }
}
