image_speed = 0.5
alarm[0] = 320
if (global.collect >= global.srank && global.shroomfollow == 1 && global.cheesefollow == 1 && global.tomatofollow == 1 && global.sausagefollow == 1 && global.pineapplefollow == 1)
    sprite_index = spr_rankS
else if (global.collect > global.arank)
    sprite_index = spr_rankA
else if (global.collect > global.brank)
    sprite_index = spr_rankB
else if (global.collect > global.crank)
    sprite_index = spr_rankC
else
    sprite_index = spr_rankD
depth = -9999
