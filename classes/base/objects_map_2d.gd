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

func found_devices_in_point(point : Vector2, excepts : Array[DeviceSimplest]) -> DeviceSimplest:
	var the_point = Node2D.new()
	the_point.global_position.point
	for children in get_children():
		if children is DeviceSimplest or children is DeviceSistem:
			if children.in_check(the_point):
				if not children in excepts:
					return children
	return null

func _process(delta: float) -> void:
	pass
