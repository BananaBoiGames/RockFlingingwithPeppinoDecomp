sound_play(sfx_slap, false, (1 << 0), true)
stun = true
stunned = 100
flash = true
instance_create(x, y, obj_bangeffect)
instance_create(x, y, obj_bumpeffect)
obj_player.vsp = -3
obj_player.hsp = 0
obj_player.movespeed = 0
obj_player.image_index = 0
obj_player.sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7)
obj_player.state = states.grabfinish
