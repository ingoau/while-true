if (room = Room5) {
	y_multiplier = -1.9
} else {
	y_multiplier = 1
}

ysp += 0.1 * y_multiplier;

if (xsp != 0) {
xsp = xsp / 1.1;
}

if keyboard_check(vk_left)
{
	if (xsp > -5) {
        xsp -= 0.25
	}
}
if keyboard_check(vk_right)
{
	if (xsp < 5) {
        xsp += 0.25
	}
}

if place_meeting(x, y+y_multiplier, oCollideable) {
	ysp = 0
	jumps = 0
}

if (place_meeting(x, y+y_multiplier, oCollideable))
{

        if (keyboard_check(vk_up))
        {
                ysp = -3 * y_multiplier
        }
}

if (room = Room3) {
        if (keyboard_check_pressed(vk_up) and jumps < 3)
        {
                ysp = -3.5 * y_multiplier
				jumps = jumps+1
        }
}

if (y > room_height or y < 0 or x > room_width or x < 0 or place_meeting(x, y, oRestartLevel)) { // if the player is outside of the room

    room_restart(); 

}

if place_meeting(x, y, oFlag) {
	if (room = Room5) {
		room_goto(Room1)
	} else {
		room_goto_next()
	}
}


move_and_collide(xsp, ysp, oCollideable)
