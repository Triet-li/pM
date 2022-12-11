key_left = keyboard_check(vk_left) || keyboard_check(ord("A")); // return 1 (true) if pressed
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S")); 
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));

var horizontalMoving = key_right - key_left; 
var verticalMoving = key_down - key_up;
horizontalSpeed = movingSpeed * horizontalMoving;
verticalSpeed = movingSpeed * verticalMoving;


// Check if there is a horizontal collision
if( place_meeting(x+horizontalSpeed, y, obj_walls))
{
	// this loops: moving closer to the wall before stopping
	while( !place_meeting(x+sign(horizontalSpeed), y, obj_walls)) // sign returning 1 if hsp is positive and otherwise
	{
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}
x = x + horizontalSpeed; // x: horizontal coordinate in room 


// Check if there is a vertical collision
if( place_meeting(x, y+verticalSpeed, obj_walls))
{
	// this loops: moving closer to the wall before stopping
	while( !place_meeting(x, y+sign(verticalSpeed), obj_walls)) // sign returning 1 if hsp is positive and otherwise
	{
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}
y = y + verticalSpeed; // x: horizontal coordinate in room 



// Animation
if(key_up || key_down)
{
	
	image_speed = 1;
	if(verticalSpeed == 0)
		sprite_index = spr_v_pac_moving;
	else
		sprite_index = spr_v_pac_moving;
}
else
{
	image_speed = 1;
	if(horizontalSpeed == 0)
		sprite_index = spr_h_pac_moving;
	else
		sprite_index = spr_h_pac_moving;
}

if(horizontalSpeed != 0) image_xscale = sign(horizontalSpeed);
if(verticalSpeed != 0) image_yscale = sign(verticalSpeed);// make our pacMan face left or right; 