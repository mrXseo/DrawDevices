extends Node2D

class_name User

enum MOUSE_MODES {CLEAR, TARGET, HOLD}

var mouse_mode : int = MOUSE_MODES.CLEAR

@export var observer : UserObserver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	observer.set_user(self)
	add_child(observer)
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
