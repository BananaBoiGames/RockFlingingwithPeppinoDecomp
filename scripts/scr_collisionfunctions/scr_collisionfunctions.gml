function perform_collisions()
{
    repeat (abs(vsp))
    {
        if (!place_meeting(x, y + sign(vsp), obj_collisionparent))
        {
            y += sign(vsp);
        }
        else
        {
            vsp = 0;
            break;
        }
    }
    
    repeat (abs(hsp))
    {
        if (place_meeting(x + sign(hsp), y, obj_collisionparent) && !place_meeting(x + sign(hsp), y - 1, obj_collisionparent))
            y--;
        
        if (!place_meeting(x + sign(hsp), y, obj_collisionparent) && !place_meeting(x + sign(hsp), y + 1, obj_collisionparent) && place_meeting(x + sign(hsp), y + 2, obj_collisionparent))
            y++;
        
        if (!place_meeting(x + sign(hsp), y, obj_collisionparent))
        {
            x += sign(hsp);
        }
        else
        {
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 20)
        vsp += grav;
    
    grounded = place_meeting(x, y + 1, obj_collisionparent);
}

function perform_solid_collisions()
{
    repeat (abs(vsp))
    {
        if (!place_meeting(x, y + sign(vsp), obj_enemiesbumpable))
        {
            y += sign(vsp);
        }
        else
        {
            vsp = 0;
            break;
        }
    }
    
    repeat (abs(hsp))
    {
        if (place_meeting(x + sign(hsp), y, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y - 1, obj_enemiesbumpable))
            y--;
        
        if (!place_meeting(x + sign(hsp), y, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y + 1, obj_enemiesbumpable) && place_meeting(x + sign(hsp), y + 2, obj_enemiesbumpable))
            y++;
        
        if (!place_meeting(x + sign(hsp), y, obj_enemiesbumpable))
        {
            x += sign(hsp);
        }
        else
        {
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 20)
        vsp += grav;
    
    grounded = place_meeting(x, y + 1, obj_enemiesbumpable);
}

function perform_enemy_collisions()
{
    repeat (abs(vsp))
    {
        if (!place_meeting(x, y + sign(vsp), obj_enemiesbumpable) && !(vsp >= 0 && place_meeting(x, y + 1, obj_platform) && !place_meeting(x, y, obj_platform)))
        {
            y += sign(vsp);
        }
        else
        {
            vsp = 0;
            break;
        }
    }
    
    repeat (abs(hsp))
    {
        if (place_meeting(x + sign(hsp), y, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y - 1, obj_enemiesbumpable))
            y--;
        
        if (!place_meeting(x + sign(hsp), y, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y + 1, obj_enemiesbumpable) && place_meeting(x + sign(hsp), y + 2, obj_enemiesbumpable))
            y++;
        
        if (!place_meeting(x + sign(hsp), y, obj_enemiesbumpable))
        {
            x += sign(hsp);
        }
        else
        {
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 20)
        vsp += grav;
    
    grounded = place_meeting(x, y + 1, obj_enemiesbumpable) || (place_meeting(x, y + 1, obj_platform) && !place_meeting(x, y, obj_platform));
}
