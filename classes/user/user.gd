extends Node2D

class_name User

enum MOUSE_MODES {CLEAR, TARGET, HOLD, CREATE}

var mouse_mode : int = MOUSE_MODES.CLEAR
var work_space : ObjectsMap2D
var hold_device : DeviceSimplest

var local_settings : Panel

@export var observer : UserObserver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	observer.set_user(self)
	add_child(observer)
	work_space = $"../ObjectsMap2D"
	local_settings = $UserObserver/UserUI/LocalSettings
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if mouse_mode == MOUSE_MODES.HOLD:
			if event.button_index == MOUSE_BUTTON_LEFT:
				if work_space.add_device(hold_device, get_global_mouse_position()):
					hold_device = null
					mouse_mode = MOUSE_MODES.CLEAR
					Input.set_custom_mouse_cursor(null)
			if event.button_index == MOUSE_BUTTON_RIGHT:
				hold_device = null
				mouse_mode = MOUSE_MODES.CLEAR
				Input.set_custom_mouse_cursor(null)
		if mouse_mode == MOUSE_MODES.CLEAR:
			if event.button_index == MOUSE_BUTTON_RIGHT:
				hold_device = work_space.found_devices_in_point(get_global_mouse_position())
				if hold_device != null:
					print(hold_device)
					mouse_mode = MOUSE_MODES.TARGET
					local_settings.open()
		if mouse_mode == MOUSE_MODES.TARGET:
			if event.button_index == MOUSE_BUTTON_LEFT:
				local_settings.close()
				hold_device = null
				print(hold_device)
				mouse_mode = MOUSE_MODES.CLEAR
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_hold( device : DeviceSimplest) -> void:
	hold_device = device
	mouse_mode = MOUSE_MODES.HOLD
