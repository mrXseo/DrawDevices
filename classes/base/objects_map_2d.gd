extends Node2D

class_name ObjectsMap2D

@export_category("Space")
@export var hight : float = 0
@export var width : float = 0
@export var space_units : String = "метр"

@export_category("Background")
@export var color : Color
@export var bg_material : ShaderMaterial
var background = ColorRect.new()


func _ready() -> void:
	add_child(background)
	background.color = color
	background.size.x = width
	background.size.y = hight
	background.material = bg_material
	background.material.set_shader_parameter("import_color", background.color)

func found_devices_in_point(point : Vector2, excepts : Array[DeviceSimplest] = []) -> DeviceSimplest:
	var the_point = Node2D.new()
	print(get_tree_string_pretty())
	for children in get_children():
		if children is DeviceSimplest and (not (children in excepts)):
			if children.in_check(the_point):
				return children
	return null

func add_device(device : DeviceSimplest, global_pos : Vector2) -> bool:
	if global_pos.x > global_position.x and \
		global_pos.x < global_position.x + width - device.local_space.width and\
		global_pos.y > global_position.y and \
		global_pos.y < global_position.y + hight - device.local_space.hight:
		add_child(device)
		device.global_position = global_pos
		return true
	return false

func _process(delta: float) -> void:
	pass
