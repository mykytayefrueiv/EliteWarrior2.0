extends KinematicBody2D

const SPEED = 10000
var motion = Vector2()
var movement;
var moving = false;
# Converts any Vector2 coordinates or motion from the cartesian to the isometric system
func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 1.7)

# useful to convert mouse coordinates back to screen-space, and detect where the player wants to know.
# If we want to add mouse-based controls, we'll need this function
func isometric_to_cartesian(iso):
	var cart_pos = Vector2()
	cart_pos.x = (iso.x + iso.y * 2) / 2
	cart_pos.y = - iso.x + cart_pos.x
	return cart_pos

var destination;

func _unhandled_input(event):
	if(event.is_action_pressed('Click')):
		print(get_global_mouse_position())
		var click = get_global_mouse_position();
		
		var tilemap = get_parent().get_child(0);
		destination = tilemap.get_cell_center_global_position(click);
		print(destination)
		moving = true;

func _physics_process(delta):
	# Everything works like you're used to in a top-down game
	if moving == true:
		movement = position.direction_to(destination) * SPEED * delta;
		#movement = cartesian_to_isometric(movement)
		move_and_slide(movement)
		
		if position.distance_to(destination) < 5:
			moving = false;
		
		

func _ready():
	set_physics_process(true)
