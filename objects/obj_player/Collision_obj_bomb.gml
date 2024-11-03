if (hurted == 0 && state != states.bombpep && state != states.knightpep && state != states.knightpepattack)
{
    hsp = 0
    movespeed = 0
    image_index = 0
    state = states.bombpep
    sprite_index = spr_bombpep_intro
    instance_create((x + image_xscale * 40), y, obj_punchdust)
    instance_destroy(other.id)
}
