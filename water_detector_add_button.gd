extends Button

func _ready() -> void:
	icon = Tools.texture_resize(icon, custom_minimum_size.x, custom_minimum_size.y)
