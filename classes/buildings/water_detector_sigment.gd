extends DeviceSistem

class_name WaterDetectorSigment

const HIGHT : float = 10
const WIDTH : float = 10
const MAX_CHAIN_LINK : float = 100

var sprite : Sprite2D = Sprite2D.new()
var prev : DeviceSistem = null
var have_prev : bool = true
var next : WaterDetectorSigment = null
var have_next : bool = false


func _init(init_prev : DeviceSimplest):
	name = "WaterDetectorSigment"
	"""Предыдущее звено системы."""
	prev = init_prev
	""" Задаем размеры прибора. """ 
	local_space.set_hight(HIGHT)
	local_space.set_width(WIDTH)
	""" Задаем текстуру и выравниваем по размеру прибора. """ 
	sprite.texture = preload("res://resource/device_textures/water_detector/WaterDetectorHost.png")
	sprite.texture = Tools.texture_resize(sprite.texture, local_space.width, local_space.hight)
	sprite.position = Vector2(HIGHT/2, WIDTH/2)
	add_child(sprite)

func in_check(point : Vector2) -> bool:
	return local_space.in_check(point)

func set_next(new_next : WaterDetectorSigment):
	if !have_next:
		add_device(new_next)

func add_next(global_position : Vector2):
	if next == null:
		next = WaterDetectorSigment.new(self)
		next.global_position = global_position
		next.relocate(global_position)

func ready():
	add_child(local_space)


func locate_settings_UI():
	var buttons : Dictionary = Dictionary()

	buttons["DEL_BUTTON"] = Dictionary()
	buttons["DEL_BUTTON"]["text"] = "Удалить"
	buttons["DEL_BUTTON"]["method"] = "queue_free"

	buttons["RELOC_BUTTON"] = Dictionary()
	buttons["RELOC_BUTTON"]["text"] = "Переместить"
	buttons["RELOC_BUTTON"]["method_name"] = "relocate"
	buttons["RELOC_BUTTON"]["method_input"] = [get_global_mouse_position]
	

func relocate(new_global_position : Vector2):
	var delta : Vector2 = prev.global_position - new_global_position
	if delta.length() >= MAX_CHAIN_LINK:
		delta = delta/delta.length()*MAX_CHAIN_LINK
	self.global_position = delta
 
func _process(delta: float) -> void:
	pass
