function scr_player_chainsaw() //scr_player_chainsaw
{
    input_get()
    landAnim = false
    hsp = xscale * movespeed
    machslideAnim = false
    move = keyLeft.held + keyRight.held
    if (obj_chainsawhitbox.bumpeffect == 0)
    {
        if (movespeed <= 13 && movespeed > 0 && (sprite_index == spr_player_chainsaw || sprite_index == spr_player_chainsawstart))
            movespeed -= 0.2
        else if (movespeed <= 13 && movespeed > 0)
            movespeed -= 0.4
    }
    else if (obj_chainsawhitbox.bumpeffect == 1)
    {
        hsp = xscale * movespeed
        if (movespeed > 0)
            movespeed -= 0.2
    }
    if (movespeed < 4 && grounded && (!keyChainsaw.held))
    {
        state = states.normal
        image_index = 0
    }
    if (keyDown.held && grounded && movespeed > 0)
        state = states.crouchslide
    if (sprite_index == spr_player_chainsawstart && floor(image_index) == (image_number - 1) && movespeed > 8)
        sprite_index = spr_player_chainsaw
    else if (movespeed <= 8 || (!keyChainsaw.held))
        sprite_index = spr_player_chainsawend
    if (sprite_index == spr_player_chainsaw)
    {
        if ((!instance_exists(obj_dashcloud)) && place_meeting(x, (y + 1), obj_collisionparent))
            instance_create(x, y, obj_dashcloud)
    }
    else if (sprite_index == spr_player_chainsawend)
    {
        if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
            instance_create(x, y, obj_slidecloud)
    }
    image_speed = 0.6
    perform_collisions()
}

