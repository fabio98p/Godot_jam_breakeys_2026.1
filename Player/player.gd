class_name PlayerController
extends CharacterBody3D

@onready var head_camera_anchor: Marker3D = $HeadCameraAnchor
@onready var collision: CollisionShape3D = $CollisionShape3D
@onready var raycast: RayCast3D = $Head/Camera3D/RayCast3D

@onready var head: Node3D = $Head
@onready var camera_3d: Camera3D = $Head/Camera3D

const SPEED = 5.0
const SPRINT = 8.0
const JUMP_VELOCITY = 4.5
const SESITIVITY = 0.003

#head bob
const BOB_FREQ = 3
const BOB_AMP = 0.02
var t_bob = 0.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# WASD movement vector
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	
	# super basic locomotion
	var new_velocity = Vector2.ZERO
	var direction: Vector3 = (transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()
	if direction:
		if Input.is_action_pressed("sprint"):
			velocity.x = direction.x * SPRINT
			velocity.z = direction.z * SPRINT
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
	else:
		velocity.x = lerp(velocity.x, direction.x * SPEED, delta * 9)
		velocity.z = lerp(velocity.z, direction.x * SPEED, delta * 9)
		
	#head bobbing
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera_3d.transform.origin = head_bobbing(t_bob)

	move_and_slide()

func head_bobbing(time)-> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos

func enter_car():
	collision.disabled = true
	raycast.enabled = false
	hide()
	set_physics_process(false)
	set_process(false)
	camera_3d.current = false


func leave_car():

	collision.disabled = false
	raycast.enabled = true
	show()
	set_physics_process(true)
	set_process(true)
	camera_3d.current = true
