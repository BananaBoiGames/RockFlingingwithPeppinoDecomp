if showtext
{
    textx = 480 + (random_range(-1, 1))
    if (texty > 500)
        texty -= 5
}
else
{
    textx = 480 + (random_range(-1, 1))
    if (texty < 590)
        texty += 1
}
if (pizzacoin_timer > 0)
{
    pizzacoin_timer--
    pizzacoin_alpha = approach(pizzacoin_alpha, 1, 0.1)
}
else
    pizzacoin_alpha = approach(pizzacoin_alpha, 0, 0.1)
if (global.panic == 1)
    timestop = 0
else
    timestop = 1
if (room == rm_result_timesup)
    timestop = 1
if (global.seconds == 0 && global.minutes == 0 && room != rm_result_timesup)
{
    obj_player.state = states.timesup
    room = rm_result_timesup
    obj_player.image_index = 0
}
if (global.seconds < 0)
{
    global.seconds = 59
    global.minutes -= 1
}
if (global.seconds > 59)
{
    global.minutes += 1
    global.seconds -= 59
}
if (global.panic == 1 && global.minutes < 1)
{
    shake_mag = 3
    shake_mag_acc = 4 / room_speed
}
else if (global.panic == 1)
{
    shake_mag = 2
    shake_mag_acc = 3 / room_speed
}
if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc
    if (shake_mag < 0)
        shake_mag = 0
}
if (instance_exists(obj_player) && obj_player.state != states.timesup && obj_player.state != states.gameover)
{
    var target = obj_player
    if (obj_player.state == states.mach3 || obj_player.state == states.machroll)
        chargecamera = approach(chargecamera, (obj_player.xscale * 100), 2)
    else
        chargecamera = approach(chargecamera, 0, 2)
    if instance_exists(obj_worldpep)
        target = obj_worldpep
    var vieww = camera_get_view_width(view_camera[0])
    var viewh = camera_get_view_height(view_camera[0])
    camx = target.x - vieww / 2 + chargecamera
    camx = clamp(camx, 0, (room_width - vieww))
    camy = target.y - viewh / 2
    camy = clamp(camy, 0, (room_height - viewh))
    if (shake_mag != 0)
    {
        camx = target.x - vieww / 2 + (irandom_range((-shake_mag), shake_mag)) + chargecamera
        camx = clamp(camx, (0 + (irandom_range((-shake_mag), shake_mag))), (room_width - vieww + (irandom_range((-shake_mag), shake_mag))))
        camy = target.y - viewh / 2 + (irandom_range((-shake_mag), shake_mag))
        camy = clamp(camy, (0 + (irandom_range((-shake_mag), shake_mag))), (room_height - viewh + (irandom_range((-shake_mag), shake_mag))))
    }
    audio_listener_position((camx + vieww / 2), (camy + viewh / 2), 0)
    camera_set_view_pos(view_camera[0], camx, camy)
}
if (global.panic && global.panicbg)
{
    var a = layer_get_all()
    var b = []
    global.paniclayercount = 0
    for (var i = 0; i < array_length(a); i++)
    {
        if (string_copy(layer_get_name(a[i]), 1, 12) == "Backgrounds_")
        {
            b[global.paniclayercount] = a[i]
            global.paniclayercount++
        }
    }
    for (var j = 0; j < array_length(b); j++)
    {
        layer_script_begin(b[j], panicbg_start)
        layer_script_end(b[j], panicbg_end)
    }
    if (global.wave < global.maxwave)
        global.wave += (0.4 + global.minutes / 60)
}
