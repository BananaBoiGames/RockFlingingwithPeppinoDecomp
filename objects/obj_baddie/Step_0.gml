switch state
{
    case enemystate.idle:
        scr_enemy_idle()
        break
    case enemystate.enemythrow:
        scr_pizzagoblin_throw()
        break
    case enemystate.turn:
        scr_enemy_turn()
        break
    case enemystate.hitwall:
        scr_enemy_hitwall()
        break
    case enemystate.rolling:
        scr_enemy_rolling()
        break
    case enemystate.walk:
        scr_enemy_walk()
        break
    case enemystate.hit:
        scr_enemy_hit()
        break
    case enemystate.stun:
        scr_enemy_stun()
        break
    case enemystate.grabbed:
        scr_enemy_grabbed()
        break
}

if (flying && state == enemystate.stun && place_meeting((x + hsp), (y + vsp), obj_destructibles))
{
    with (instance_place((x + hsp), (y + vsp), obj_destructibles))
        instance_destroy()
}
if (!instance_exists(obj_slaphitbox))
    slapped = false
if (state != enemystate.stun)
    flying = 0
if (state != enemystate.hit)
    straightthrow = 0
if (state != enemystate.grabbed)
    depth = 0
if (flash && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
