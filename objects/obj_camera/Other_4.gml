x = obj_player.x
y = obj_player.y
application_surface_draw_enable(true)
if (!global.panic)
{
    switch room
    {
        case rm_tower_1:
            global.srank = 4000
            global.minutes = 2
            global.seconds = 59
            break
        case rm_fling_1:
            global.srank = 3000
            global.minutes = 2
            global.seconds = 50
            break
        case rm_hydro_1:
            global.srank = 5500
            global.minutes = 2
            global.seconds = 45
            break
        case rm_desert_1:
            global.srank = 3800
            global.minutes = 2
            global.seconds = 10
            break
    }

}
global.arank = floor(global.srank / 1.25)
global.brank = floor(global.arank / 1.25)
global.crank = floor(global.brank / 1.25)
