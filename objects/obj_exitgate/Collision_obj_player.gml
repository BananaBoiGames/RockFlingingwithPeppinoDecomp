if (global.panic == 1)
{
    with (obj_player)
    {
        if (grounded && x > (other.x + 32) && x < (other.x + 160) && keyUp.held)
        {
            audio_stop_sound(mu_pizzatime)
            global.panic = false
            if (!instance_exists(obj_endlevelfade))
                instance_create(x, y, obj_endlevelfade)
            ini_open("saveData.ini")
            ini_write_real("RockFling", "Complete", true)
            ini_close()
            if (state != states.door)
            {
                state = states.door
                obj_endlevelfade.alarm[0] = 400
                image_index = 0
            }
        }
    }
}
