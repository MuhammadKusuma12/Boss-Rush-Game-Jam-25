extends CharacterBody2D
class_name Boss

@export var player : CharacterBody2D
@export var hp : float
@export var SPEED : float

func _physics_process(delta: float) -> void:
	move_and_slide()
