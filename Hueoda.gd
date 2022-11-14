extends Node2D

onready var navigation : Navigation2D = $Navigation2D
onready var character : KinematicBody2D = $Protagonist
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _unhandled_input(event):
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
	var new_path := navigation.get_simple_path(character.global_position, event.global_position)
	character.path = new_path
