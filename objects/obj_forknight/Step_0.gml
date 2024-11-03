event_inherited()
if (hitbox == 0 && state == enemystate.walk)
{
    with (instance_create(x, y, obj_forkhitbox))
        baddieID = other.id
    hitbox = 1
}
