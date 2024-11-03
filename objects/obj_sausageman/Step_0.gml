event_inherited()
if (cigar == 1 && cigarcreate == 0 && (state == enemystate.idle || state == enemystate.walk || state == enemystate.turn))
{
    cigarcreate = 1
    with (instance_create(x, y, obj_sausagemancigar))
        ID = other.id
}
