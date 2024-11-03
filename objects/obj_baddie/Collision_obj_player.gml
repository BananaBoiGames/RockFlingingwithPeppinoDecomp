with (obj_player)
{
    if (y < other.y && attacking == 0 && (state == states.jump || state == states.highjump))
    {
        if (keyJump.held && vsp > 0)
        {
            sound_play(sfx_stomp, false, (1 << 0), true)
            sprite_index = spr_player_stompprep
            image_index = 0
            stompAnim = true
            vsp = -14
            state = states.jump
            instance_create(x, y, obj_bangeffect)
            other.state = enemystate.stun
            other.stunned = 200
            other.image_index = 0
        }
    }
    if (y < other.y && sprite_index == spr_player_facestomp)
    {
        if (vsp > 0)
        {
            sound_play(sfx_stomp, false, (1 << 0), true)
            image_index = 0
            sprite_index = spr_player_facestomphit
            vsp = -7
            instance_create(x, y, obj_bangeffect)
            other.state = enemystate.stun
            other.stunned = 200
            other.image_index = 0
        }
    }
    if (other.flying == 0 && other.object_index == obj_sausageman)
    {
        if (((!(place_meeting(x, (y + 1), obj_collisionparent))) && (state == states.mach2 || state == states.machroll)) || state == states.mach1)
        {
            hsp = (-xscale) * 4
            vsp = -4
            if (x != other.x)
                other.image_xscale = (-(sign(other.x - x)))
            other.state = enemystate.rolling
            sound_play(sfx_punch, false, (1 << 0), true)
            instance_create(x, y, obj_bangeffect)
            image_index = 0
            state = states.tackle
            other.stunned = 200
        }
    }
    if (state == states.mach1)
    {
        sound_play(sfx_enemyHit, false, (1 << 0), true)
        instance_create(x, y, obj_bumpeffect)
        if (x != other.x)
            other.image_xscale = (-(sign(other.x - x)))
        other.stunned = 40
        other.vsp = -5
        other.hsp = (-other.image_xscale) * 3
        other.state = enemystate.stun
        hsp = (-xscale) * 4
        vsp = -4
        image_index = 0
        state = states.tackle
    }
    if (state == states.mach2 || state == states.machroll || state == states.climbwall)
    {
        with (other)
        {
            if place_meeting(x, (y + 1), obj_collisionparent)
            {
                with (obj_player)
                {
                    sound_play(sfx_stomp, false, (1 << 0), true)
                    instance_create(x, y, obj_bumpeffect)
                    other.stunned = 200
                    other.vsp = -10
                    other.hsp = xscale * 5
                    other.state = enemystate.stun
                    if (state == states.mach2)
                    {
                        image_index = 0
                        machpunchAnim = 1
                        if (!(place_meeting(x, (y + 1), obj_collisionparent)))
                            vsp = -9
                    }
                }
            }
        }
    }
    if (attacking && state != states.mach2)
    {
        instance_create(x, y, obj_bumpeffect)
        instance_destroy(other.id)
    }
}
