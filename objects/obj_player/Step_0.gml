switch state
{
    case states.normal:
        scr_player_normal()
        break
    case states.menu:
        scr_player_menu()
        break
    case states.handstandjump:
        scr_player_handstandjump()
        break
    case states.gottreasure:
        scr_player_gottreasure()
        break
    case states.knightpep:
        scr_player_knightpep()
        break
    case states.knightpepattack:
        scr_player_knightpepattack()
        break
    case states.meteorpep:
        scr_player_meteorpep()
        break
    case states.bombpep:
        scr_player_bombpep()
        break
    case states.grabbing:
        scr_player_grabbing()
        break
    case states.grabfinish:
        scr_player_grabfinish()
        break
    case states.charge:
        scr_player_charge()
        break
    case states.chainsawpogo:
        scr_player_chainsawpogo()
        break
    case states.shotgunjump:
        scr_player_shotgunjump()
        break
    case states.stunned:
        scr_player_stunned()
        break
    case states.highjump:
        scr_player_highjump()
        break
    case states.chainsaw:
        scr_player_chainsaw()
        break
    case states.facestomp:
        scr_player_facestomp()
        break
    case states.timesup:
        scr_player_timesup()
        break
    case states.machroll:
        scr_player_machroll()
        break
    case states.pistol:
        scr_player_pistol()
        break
    case states.shotgun:
        scr_player_shotgun()
        break
    case states.machfreefall:
        scr_player_machfreefall()
        break
    case states.superslam:
        scr_player_superslam()
        break
    case states.slam:
        scr_player_slam()
        break
    case states.skateboard:
        scr_player_skateboard()
        break
    case states.grind:
        scr_player_grind()
        break
    case states.bossdefeat:
        scr_player_bossdefeat()
        break
    case states.bossintro:
        scr_player_bossintro()
        break
    case states.smirk:
        scr_player_smirk()
        break
    case states.pizzathrow:
        scr_player_pizzathrow()
        break
    case states.gameover:
        scr_player_gameover()
        break
    case states.Sjumpland:
        scr_player_Sjumpland()
        break
    case states.freefallprep:
        scr_player_freefallprep()
        break
    case states.runonball:
        scr_player_runonball()
        break
    case states.boulder:
        scr_player_boulder()
        break
    case states.keyget:
        scr_player_keyget()
        break
    case states.tackle:
        scr_player_tackle()
        break
    case states.slipnslide:
        scr_player_slipnslide()
        break
    case states.ladder:
        scr_player_ladder()
        break
    case states.jump:
        scr_player_jump()
        break
    case states.victory:
        scr_player_victory()
        break
    case states.comingoutdoor:
        scr_player_comingoutdoor()
        break
    case states.Sjump:
        scr_player_Sjump()
        break
    case states.Sjumpprep:
        scr_player_Sjumpprep()
        break
    case states.crouch:
        scr_player_crouch()
        break
    case states.crouchjump:
        scr_player_crouchjump()
        break
    case states.crouchslide:
        scr_player_crouchslide()
        break
    case states.mach1:
        scr_player_mach1()
        break
    case states.mach2:
        scr_player_mach2()
        break
    case states.mach3:
        scr_player_mach3()
        break
    case states.climbwall:
        scr_player_climbwall()
        break
    case states.machslide:
        scr_player_machslide()
        break
    case states.bump:
        scr_player_bump()
        break
    case states.hurt:
        scr_player_hurt()
        break
    case states.freefall:
        scr_player_freefall()
        break
    case states.freefallland:
        scr_player_freefallland()
        break
    case states.hang:
        scr_player_hang()
        break
    case states.door:
        scr_player_door()
        break
    case states.barrelnormal:
        scr_player_barrelnormal()
        break
    case states.barrelfall:
        scr_player_barrelfall()
        break
    case states.barrelmach1:
        scr_player_barrelmach1()
        break
    case states.barrelmach2:
        scr_player_barrelmach2()
        break
    case states.barrelfloat:
        scr_player_barrelfloat()
        break
    case states.barrelcrouch:
        scr_player_barrelcrouch()
        break
    case states.barrelslipnslide:
        scr_player_barrelslipnslide()
        break
    case states.barrelroll:
        scr_player_barrelroll()
        break
    case states.current:
        scr_player_current()
        break
    case states.slap:
        scr_player_slap()
        break
    case states.suplexdash:
        scr_player_suplexdash()
        break
    case states.taunt:
        scr_player_taunt()
        break
}

scr_playersounds()
audio_emitter_position(playeremitter, x, y, 0)
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create((x + (random_range(-5, obj_trash))), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create((x + (random_range(-5, obj_trash))), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (input_buffer_jump < 8)
    input_buffer_jump++
if (slapbuffer < 8)
    slapbuffer++
if (key_particles == 1 && global.key_inv == 1)
    instance_create(random_range((x + 25), (x - 25)), random_range((y + 35), (y - 25)), obj_keyeffect)
if (hurted == 0)
    image_alpha = 1
if (state == states.mach2 || state == states.machfreefall || state == states.machroll || state == states.mach3 || state == states.superslam || state == states.freefall || state == states.Sjump || state == states.barrelmach2 || state == states.barrelroll || state == states.charge || state == states.current)
    attacking = 1
else
    attacking = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed
if (state != states.freefallland && state != states.normal && state != states.machslide)
    facehurt = false
if (state != states.normal)
    idle = 0
if (state != states.suplexdash && grounded)
    suplexmove = false
if (state != states.mach1 && state != states.jump && state != states.suplexdash)
    momemtum = 0
if (state != states.pistol && state != states.shotgun && state != states.shotgunjump)
    shoot = 1
if (state != states.slam)
    slamming = 0
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
    superslam = 0
if (state != states.mach2)
    machpunchAnim = 0
if (state != states.jump)
    ladderbuffer = 0
if (state != states.jump)
    stompAnim = false
if ((place_meeting(x, y, obj_water) || place_meeting(x, y, obj_water2) || place_meeting(x, y, obj_current) || place_meeting(x, y, obj_current2)) && state != states.barrelfloat)
    underwater = true
else
    underwater = false
if (underwater && alarm[8] <= 0)
    alarm[8] = 30
if underwater
    grav = 0.35
else
    grav = 0.5
if ((!instance_exists(baddiegrabbedID)) && state == states.grabbing)
    state = states.normal
var iseffectstate = (state == states.mach3 || state == states.machroll || state == states.superslam || state == states.Sjump || state == states.machfreefall || state == states.suplexdash)
if iseffectstate
{
    if (!macheffect)
    {
        macheffect = true
        toomuchalarm1 = 6
        create_mach3effect(x, y, sprite_index, (image_index - 1))
    }
}
else
    macheffect = false
if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1
    if (toomuchalarm1 <= 0 && iseffectstate)
    {
        create_mach3effect(x, y, sprite_index, (image_index - 1))
        toomuchalarm1 = 6
    }
}
if (state != states.bump && state != states.crouch && state != states.machroll && state != states.hurt && state != states.crouchslide && state != states.crouchjump && state != states.barrelroll && state != states.barrelslipnslide)
    mask_index = mask_player
else
    mask_index = mask_playercrouch
