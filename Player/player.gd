class_name PlayerController
extends CharacterBody3D

@onready var head_camera_anchor: Marker3D = $HeadCameraAnchor
@onready var collision: CollisionShape3D = $CollisionShape3D
@onready var raycast: RayCast3D = $Head/Camera3D/RayCast3D

@onready var head: Node3D = $Head
@onready var camera_3d: Camera3D = $Head/Camera3D

@onready var annaffiatoio: Node3D = $Head/Camera3D/annaffiatoio
@onready var annaffiatoio_vuoto: Node3D = $Head/Camera3D/annaffiatoioVUOTO

var mouse_input: Vector2 = Vector2.ZERO

const SPEED = 5.0
const SPRINT = 8.0
const JUMP_VELOCITY = 4.5
const SESITIVITY = 0.003

#head bob
const BOB_FREQ = 3
const BOB_AMP = 0.02
var t_bob = 0.0

var stop_player: bool = false
func _ready() -> void:
	GS.show_inventory.connect(player_stopped)
	GS.show_plant_norm_seed_interface.connect(player_stopped)
	GS.show_plant_tree_interface.connect(player_stopped)
	GS.show_sell_inteface.connect(player_stopped)

func _process(delta: float) -> void:
	if GS.bucket_full:
		annaffiatoio.visible = true
		annaffiatoio_vuoto.visible = false
	else: 
		annaffiatoio.visible = false
		annaffiatoio_vuoto.visible = true

func player_stopped(stopped, dirt):
	stop_player = stopped

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.is_action_just_pressed("interaction2"):
		if !GS.inventory_is_open:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if !stop_player:
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

#func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		#get_window().grab_focus()
	#
	## Invece di ruotare subito, accumuliamo lo spostamento
	#elif event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		#mouse_input += event.relative
