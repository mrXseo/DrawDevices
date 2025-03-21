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
	prev = init_prev
	local_space.set_hight(HIGHT)
	local_space.set_width(WIDTH)

func in_check(point:Node2D) -> bool:
	if local_space.in_check(point):
		return true
	if have_next:
		return next.in_check(point)
	return false

func set_next(new_next : WaterDetectorSigment):
	if !have_next:
		add_device(new_next)

func add_next(global_position : Vector2):
	if next == null:
		next = WaterDetectorSigment.new(self)
		next.global_position = global_position
		next.relocate(global_position)

func ready():
	sprite.texture = preload("res://resource/device_textures/water_detector/WaterDetectorNode.png")
	add_child(sprite)
	print(sprite.texture.get_size())

func relocate(new_global_position : Vector2):
	var delta : Vector2 = self.global_position - new_global_position
	if delta.length() <= MAX_CHAIN_LINK:
		delta = delta/delta.length()*MAX_CHAIN_LINK
	self.global_position = delta

func _process(delta: float) -> void:
	pass
