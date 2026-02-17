extends CharacterBody3D

@export var speed = 5.0
@export var jump_velocity = 4.5
@export var sensivity = 0.005

var top_visibility_head = 60
var bottom_visibility_head = -80

var mouse_input: Vector2 = Vector2.ZERO

@onready var head: Node3D = $Head
@onready var camera_3d: Camera3D = $Head/Camera3D
@onready var ray_cast_3d: RayCast3D = $Head/RayCast3D

func _ready() -> void:
	ray_cast_3d


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# handle esc
	if Input.is_action_just_pressed("esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		get_window().grab_focus()
	
	# Invece di ruotare subito, accumuliamo lo spostamento
	elif event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		mouse_input += event.relative

func _process(delta: float) -> void:
	if mouse_input.length() > 0:
		# Applichiamo la rotazione usando delta per renderla indipendente dal framerate
		# Nota: la sensibilità potrebbe dover essere alzata rispetto a prima
		rotation.y -= mouse_input.x * sensivity
		head.rotation.x -= mouse_input.y * sensivity
		
		# Clamp della testa
		head.rotation_degrees.x = clamp(head.rotation_degrees.x, bottom_visibility_head, top_visibility_head)
		
		# RESET fondamentale: svuotiamo l'accumulatore per il prossimo frame
		mouse_input = Vector2.ZERO
