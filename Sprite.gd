extends Sprite

const SPRITES_MAP := {
	Vector2.RIGHT: preload("Portagonist.png"),
	Vector2.LEFT: preload("Portagonist.png"),
	Vector2.DOWN: preload("Portagonist.png"),
	Vector2.UP: preload("Portagonist.png"),
	Vector2(1.0, 1.0): preload("Portagonist.png"),
	Vector2(1.0, -1.0): preload("Portagonist.png"),
	Vector2(-1.0, -1.0): preload("Portagonist.png"),
	Vector2(-1.0, 1.0): preload("Portagonist.png"),
}
	
var look_direction := Vector2.RIGHT

func _process(_delta: float) -> void:
	var input_vector := Vector2(
		float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")),
		float(Input.is_action_pressed("ui_down")) - float(Input.is_action_pressed("ui_up"))
	)
	if input_vector.length() > 0.0 and input_vector != look_direction:
		texture = SPRITES_MAP[input_vector]
		look_direction = input_vector
		flip_h  = sign(look_direction.x)  == -1.0
	position.y  = sin(OS.get_ticks_msec() / 200.0) * 8.0
