extends CharacterBody2D

var rotation_speed := 2.0
var speed := 1.0
var terminal_velocity := 5.0
var gravity_strength := 1.0

func _process(delta: float) -> void:
	movement(delta)
	gravity(delta)

func movement(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotation -= rotation_speed * delta
	if Input.is_action_pressed("right"):
		rotation += rotation_speed * delta
	if Input.is_action_pressed("boost"):
		velocity += transform.y * speed * delta
		velocity.x = clamp(velocity.x, -terminal_velocity, terminal_velocity)
		velocity.y = clamp(velocity.y, -terminal_velocity, terminal_velocity)
		print(velocity)
	position -= velocity

func gravity(delta: float) -> void:
	var gravity_direction: Vector2 = (%Planet.global_position - self.global_position).normalized()
	velocity -= gravity_direction * gravity_strength * delta
