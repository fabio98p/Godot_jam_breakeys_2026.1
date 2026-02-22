extends Node3D
const AXE_SEED = preload("uid://c3sxrr8mi2fet")

@onready var spowns_point: Node3D = $SpownsPoint
var spown_point_list : Array[Node] 
func _ready() -> void:
	spown_point_list = spowns_point.get_children()
	GS.finish_day.connect(_on_finish_day)

func _on_finish_day():
	if randi_range(0,1) == 0:
		var available_spown_point: Array[Node]
		for point in spown_point_list:
			if point.current_seed == null:
				available_spown_point.append(point)
		if available_spown_point.size() != 0:
			available_spown_point[randi_range(0, available_spown_point.size()-1)].spawn_seed()
