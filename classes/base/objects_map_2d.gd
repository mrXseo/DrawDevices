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
	var bg_import_color = background.material.get_shader_parameter("import_color")
	


func _process(delta: float) -> void:
	pass
