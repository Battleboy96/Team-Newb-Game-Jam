extends CharacterBody2D

var rotation_speed := 2.0
var thrust := 5.0
var terminal_velocity := 10.0
var gravity_strength := 3.0

func _ready() -> void:
	%Thrust.hide()

func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		%Thrust.show()
	else:
		%Thrust.hide()
	%Label.text = "Velocity: " + var_to_str(velocity.round())
	%Line.points = PackedVector2Array([%Planet.global_position, self.global_position])

func _physics_process(delta: float) -> void:
	movement(delta)
	gravity(delta)
	velocity.x = clamp(velocity.x, -terminal_velocity, terminal_velocity)
	velocity.y = clamp(velocity.y, -terminal_velocity, terminal_velocity)

func movement(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotation -= rotation_speed * delta
	if Input.is_action_pressed("right"):
		rotation += rotation_speed * delta
	if Input.is_action_pressed("boost"):
		velocity += transform.y * thrust * delta
		#print(velocity)
	position -= velocity

func gravity(delta: float) -> void:
	var gravity_direction: Vector2 = (%Planet.global_position - self.global_position).normalized()
	velocity -= gravity_direction * gravity_strength * delta
