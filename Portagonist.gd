extends KinematicBody2D

var speed := 100
var path := PoolVector2Array() setget set_path

func _ready() -> void:
	set_process(false)

func set_path(value: PoolVector2Array):
	path = value
	if  value.size() == 0:
		return
	set_process(true)

func _process(delta: float):
	var move_distance : = speed * delta
	move_along_path(move_distance);

func move_along_path(distance: float):
	var current_point := position
	for _i in range(path.size()):
		var next_point_distance := current_point.distance_to(path[0])
		if distance <= next_point_distance and distance >= 0.0:
			position = current_point.linear_interpolate(path[0], distance / next_point_distance)
			break
		elif distance < 0.0:
			position = path[0]
			set_process(false)
			break
		distance -= next_point_distance
		current_point = path[0]
		path.remove(0)


