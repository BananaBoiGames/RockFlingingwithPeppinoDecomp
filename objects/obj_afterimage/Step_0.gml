for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        for (var l = 0; l < array_length(alarm); l++)
        {
            if (alarm[l] >= 0)
                alarm[l]--
        }
        switch identifier
        {
            case (1 << 0):
                if (obj_player.state != states.mach2 && obj_player.state != states.barrelmach2 && obj_player.state != states.barrelroll)
                    alarm[0] = 0
                visible = obj_player.visible
                break
            case (2 << 0):
                if (obj_player.state != states.mach3 && obj_player.state != states.machroll && obj_player.state != states.superslam && obj_player.state != states.Sjump && obj_player.state != states.machfreefall && obj_player.state != states.suplexdash)
                    alarm[0] = 0
                visible = obj_player.visible
                break
        }

        if (alarm[1] == 0)
        {
            other.alpha[identifier] = 0
            alarm[2] = 3
        }
        if (alarm[2] == 0)
        {
            other.alpha[identifier] = 1
            if (identifier == (2 << 0))
                other.alpha[identifier] = alpha
            alarm[1] = 3
        }
        if (alarm[0] == 0)
        {
            b = undefined
            ds_list_delete(global.afterimage_list, i)
            i--
        }
    }
}
