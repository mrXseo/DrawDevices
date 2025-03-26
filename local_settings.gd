extends Panel

var open_position : Vector2
var user : User
var user_ui : Control

func _ready() -> void:
	user = $"../../.."
	user_ui = user.observer.UserUI
func open():
	visible = true
	open_position = get_global_mouse_position()

func close():
	visible = false


func _process(delta: float) -> void:
	if visible:
		global_position = open_position
	if (user_ui.get_rect().size.x < position.x or position.x < 0 or \
		user_ui.get_rect().size.y < position.y or position.y < 0):
		close()
		user.mouse_mode = user.MOUSE_MODES.CLEAR
