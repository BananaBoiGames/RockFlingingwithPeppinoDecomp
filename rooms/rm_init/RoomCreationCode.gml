pal_swap_init_system(shd_pal_swapper)
window_set_size(960, 540)
randomize()
global.collect = 0
global.ammo = 0
global.pizzacoins = 1000
global.goldenpiece1 = false
global.goldenpiece2 = false
global.goldenpiece3 = false
global.goldenpiece4 = false
global.srank = 4000
global.arank = 3500
global.brank = 3000
global.crank = 2500
global.panic = false
global.secretsfound = 0
global.lapping = false
global.saveroom = ds_list_create()
global.baddieroom = ds_list_create()
global.collectlist = ds_list_create()
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", 1, 0)
global.key_inv = 0
global.keyget = 0
global.shroomfollow = 0
global.cheesefollow = 0
global.tomatofollow = 0
global.sausagefollow = 0
global.pineapplefollow = 0
global.upgrade_sjump = false
global.upgrade_mach4 = false
global.upgrade_climbwall = false
global.upgrade_charge = false
global.upgrade_magnet = false
global.upgrade_bodyslam = false
options_init()
global.upgrade_charge = true
global.upgrade_mach4 = true
global.upgrade_bodyslam = true
room_goto(rm_fling_1)

enum states {
    normal = 0,
    menu = 1,
    handstandjump = 2,
    gottreasure = 3,
    knightpep = 4,
    knightpepattack = 5,
    meteorpep = 6,
    bombpep = 7,
    grabbing = 8,
    grabfinish = 9,
    charge = 10,
    chainsawpogo = 11,
    shotgunjump = 12,
    stunned = 13,
    highjump = 14,
    chainsaw = 15,
    facestomp = 16,
    timesup = 17,
    machroll = 18,
    pistol = 19,
    shotgun = 20,
    machfreefall = 21,
    superslam = 22,
    slam = 23,
    skateboard = 24,
    grind = 25,
    bossdefeat = 26,
    bossintro = 27,
    smirk = 29,
    pizzathrow = 30,
    gameover = 31,
    Sjumpland = 32,
    freefallprep = 33,
    runonball = 34,
    boulder = 35,
    keyget = 36,
    tackle = 37,
    slipnslide = 38,
    ladder = 39,
    jump = 40,
    victory = 41,
    comingoutdoor = 42,
    Sjump = 43,
    Sjumpprep = 44,
    crouch = 45,
    crouchjump = 46,
    crouchslide = 47,
    mach1 = 48,
    mach2 = 49,
    mach3 = 50,
    climbwall = 51,
    machslide = 52,
    bump = 53,
    hurt = 54,
    freefall = 55,
    freefallland = 56,
    hang = 57,
    door = 58,
    barrelnormal = 59,
    barrelfall = 60,
    barrelmach1 = 61,
    barrelmach2 = 62,
    barrelfloat = 63,
    barrelcrouch = 64,
    barrelslipnslide = 65,
    barrelroll = 66,
    current = 67,
    slap = 69,
    suplexdash = 70,
    taunt = 68,
}

enum enemystate
{
	idle = 71,
	enemythrow = 72,
	turn = 73,
	hitwall = 74,
	rolling = 75,
	walk = 76,
	hit = 77,
	stun = 78,
	grabbed = 79,
}
