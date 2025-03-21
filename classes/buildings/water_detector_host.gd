extends DeviceSistem

class_name WaterDetectorHost

var sprite : Sprite2D = Sprite2D.new()

func _ready() -> void:
	sprite.texture = preload("res://resource/device_textures/water_detector/WaterDetectorHost.png")
	add_child(sprite)
	add_device(WaterDetectorSigment.new(self))
	
