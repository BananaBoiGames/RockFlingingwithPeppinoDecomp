function input() //gml_Script_input
{
    return 
    {
        up: vk_up,
        down: vk_down,
        left: vk_left,
        right: vk_right,
        jump: ord("Z"),
        dash: vk_lshift,
        slap: ord("X"),
        chainsaw: ord("A"),
        taunt: ord("C"),
        start: vk_escape,
        gamepad: 
        {
            up: gp_padu,
            down: gp_padd,
            left: gp_padl,
            right: gp_padr,
            jump: gp_face1,
            dash: gp_shoulderr,
            slap: gp_face3,
            chainsaw: gp_face2,
            taunt: gp_face4,
            start: gp_start
        }
    };
}

function input_key(argument0, argument1, argument2) //input_key
{
    if (argument2 == undefined)
        argument2 = false
    if gamepad_is_connected(0)
    {
        if argument2
        {
            return 
            {
                pressed: (-(gamepad_button_check_pressed(0, argument1))),
                held: (-(gamepad_button_check(0, argument1)))
            };
        }
        return 
        {
            pressed: gamepad_button_check_pressed(0, argument1),
            held: gamepad_button_check(0, argument1)
        };
    }
    if argument2
    {
        return 
        {
            pressed: (-keyboard_check_pressed(argument0)),
            held: (-keyboard_check(argument0))
        };
    }
    return 
    {
        pressed: keyboard_check_pressed(argument0),
        held: keyboard_check(argument0)
    };
}

function input_get() //input_get
{
    keyUp = input_key(input().up, input().gamepad.up)
    keyDown = input_key(input().down, input().gamepad.down)
    keyLeft = input_key(input().left, input().gamepad.left, true)
    keyRight = input_key(input().right, input().gamepad.right)
    keyJump = input_key(input().jump, input().gamepad.jump)
    keyDash = input_key(input().dash, input().gamepad.dash)
    keySlap = input_key(input().slap, input().gamepad.slap)
    keyChainsaw = input_key(input().chainsaw, input().gamepad.chainsaw)
    keyTaunt = input_key(input().taunt, input().gamepad.taunt)
    keyStart = input_key(input().start, input().gamepad.start)
}

