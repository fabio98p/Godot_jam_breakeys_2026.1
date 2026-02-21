class_name HeadController
extends Node3D

var player_controller: PlayerController
var input_rotation: Vector3
var mouse_input: Vector2
var mouse_sensitivity: float = 0.005

var use_interpolation: bool = false
var circle_strafe: bool = true

var stop_player: bool = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player_controller = get_parent()

	GS.show_inventory.connect(player_stopped)
	GS.show_plant_norm_seed_interface.connect(player_stopped)
	GS.show_plant_tree_interface.connect(player_stopped)
	GS.show_sell_inteface.connect(player_stopped)

func player_stopped(stopped, dirt = ""):
	stop_player = stopped
	
func _input(event: InputEvent) -> void:
	if !stop_player:
		if event is InputEventMouseMotion:
			mouse_input.x += -event.screen_relative.x * mouse_sensitivity
			mouse_input.y += -event.screen_relative.y * mouse_sensitivity

func _process(_delta: float) -> void:
	if !stop_player:
		input_rotation.x = clampf(input_rotation.x + mouse_input.y, deg_to_rad(-90), deg_to_rad(85))
		input_rotation.y += mouse_input.x
		
		# rotate camera controller (up/down)
		player_controller.head_camera_anchor.transform.basis = Basis.from_euler(Vector3(input_rotation.x, 0.0, 0.0))
		
		# rotate player (left/right)
		player_controller.global_transform.basis = Basis.from_euler(Vector3(0.0, input_rotation.y, 0.0))
		
		global_transform = player_controller.head_camera_anchor.get_global_transform_interpolated()
		
		mouse_input = Vector2.ZERO
