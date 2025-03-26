extends DeviceSistem

class_name WaterDetectorHost

var sprite : Sprite2D = Sprite2D.new()

const HIGHT : float = 50
const WIDTH : float = 50


func _init() -> void:
	name = "WaterDetectorHost"+str(randf())
	""" Задаем размеры прибора. """ 
	local_space.set_hight(HIGHT)
	local_space.set_width(WIDTH)
	""" Задаем текстуру и выравниваем по размеру прибора. """ 
	sprite.texture = preload("res://resource/device_textures/water_detector/WaterDetectorHost.png")
	sprite.texture = Tools.texture_resize(sprite.texture, local_space.width, local_space.hight)
	add_child(sprite)


func _ready() -> void:
	pass
