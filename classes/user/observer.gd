extends Camera2D

class_name UserObserver

@export_category("zoom")
@export var zoom_min : float = 0.1
@export var zoom_max : float = 3

@export_category("UI")
@export var UserUI : Control

var user : User

var move_cursor_image : Image = Image.new()
var move_cursor_image_resize = 16


func set_user(new_user:User):
	user = new_user

var MOUSE_BUTTON_LEFT_PRESSED_FLAG = false
var MOUSE_BUTTON_RIGHT_PRESSED_FLAG = false
var MOUSE_WHILE_BUTTON_PRESSED_FLAG = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			MOUSE_BUTTON_LEFT_PRESSED_FLAG = event.pressed
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			MOUSE_BUTTON_RIGHT_PRESSED_FLAG = event.pressed
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom -= Vector2(0.1, 0.1)
			if zoom.x < zoom_min:
				zoom = Vector2(zoom_min, zoom_min)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom += Vector2(0.1, 0.1)
			if zoom.x > zoom_max:
				zoom = Vector2(zoom_max, zoom_max)
		elif event.button_index == MOUSE_BUTTON_MIDDLE:
			MOUSE_WHILE_BUTTON_PRESSED_FLAG = event.pressed
	elif event is InputEventMouseMotion:
		if MOUSE_WHILE_BUTTON_PRESSED_FLAG:
			user.global_position -= event.relative*(1/zoom.x)
			Input.set_custom_mouse_cursor(move_cursor_image)
		else:
			Input.set_custom_mouse_cursor(null)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UserUI.size = get_viewport().get_size()
	UserUI.position = Vector2(0,0)
	UserUI.position -= UserUI.size/2
	print(UserUI.position)
	move_cursor_image.load("res://7727808.png")
	move_cursor_image.resize(
		move_cursor_image.get_width()/move_cursor_image_resize,
		move_cursor_image.get_height()/move_cursor_image_resize
	)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(MOUSE_WHILE_BUTTON_PRESSED_FLAG)
	if user.mouse_mode == user.MOUSE_MODES.CLEAR:
		pass
	UserUI.size = get_viewport().get_size()
	UserUI.scale = Vector2(1/zoom.x, 1/zoom.y)
	UserUI.position = Vector2(0,0)
	UserUI.position -= Vector2( UserUI.size.x*UserUI.scale.x,
								UserUI.size.y*UserUI.scale.y)/2
	
