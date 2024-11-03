if instance_exists(baddieID)
{
    x = baddieID.x
    y = baddieID.y
    image_xscale = baddieID.image_xscale
    with (baddieID)
    {
        if (state != enemystate.walk)
        {
            hitbox = 0
            instance_destroy(other.id)
        }
    }
}
