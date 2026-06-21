extends CharacterBody2D

@export var mass: float = 1
@export var parent: ParentBody
@export var motion: Vector2 = Vector2(0, 0)

@export var a: float #semi-major axis
@export var e: float #eccentricity
@export var w: float #argument of periapsis

func _physics_process(delta: float) -> void:
	pass
	
func calc_orbit():
	pass
