extends KinematicBody2D

var velocity = Vector2(0, 0);

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = 100;
		velocity.y = 0;
	if Input.is_action_pressed("ui_left"):
		velocity.x = -100;
		velocity.y = 0;
	if Input.is_action_pressed("ui_up"):
		velocity.y = -100;
		velocity.x = 0;
	if Input.is_action_pressed("ui_down"):
		velocity.y = 100;
		velocity.x = 0;
	
	move_and_slide(velocity)
	
	velocity.x = lerp(velocity.x, 0, 0.1)
	velocity.y = lerp(velocity.y, 0, 0.1)
