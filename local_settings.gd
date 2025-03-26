extends Panel

var open_position : Vector2
var user : User
var user_ui : Control

var container : VBoxContainer

func _ready() -> void:
	user = $"../../.."
	user_ui = user.observer.UserUI
	set_process(visible)
	container = $VBoxContainer

func open():
	visible = true
	open_position = get_global_mouse_position()
	set_process(true)

func close():
	visible = false
	set_process(false)

func _process(delta: float) -> void:
	if visible:
		global_position = open_position
	if (user_ui.get_rect().size.x < position.x or position.x < 0 or \
		user_ui.get_rect().size.y < position.y or position.y < 0):
		close()
		user.mouse_mode = user.MOUSE_MODES.CLEAR

func in_check(point : Vector2) -> bool:
	print(size)
	if global_position.x > point.x and global_position.y > point.y and \
	global_position.x < point.x + size.x and global_position.y < point.y + size.y:
		return true
	return false

func load_menu(device : DeviceSimplest):
	clear_menu()
	if device.has_method("get_menu"):
		for button in device.get_menu():
			container.add_child(button)

func clear_menu():
	for children in container.get_children():
		children.queue_free()
