extends Button

@export var fixated : bool = false
@onready var fixate_button : Button = $FixateButton

@onready var menu_panel : Panel = $MenuPanel
@onready var time_locker : Timer = $"../Locker"
var time_lock

func _on_pressed() -> void:
	switch_menu()

func switch_menu() -> int:
	if time_lock:
		return 0
	if not fixated:
		menu_panel.visible = not menu_panel.visible
		fixate_button.visible = not fixate_button.visible
	elif menu_panel.visible:
		fixate_button.modulate = Color(1, 0.5, 0.5)
		create_tween().tween_property(fixate_button, "modulate",  Color(1, 1, 1), 1)
	time_locker.start()
	time_lock = true
	return 1


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if menu_panel.visible:
			print("CNFNH")
			if not check_event_point_in(self, event.position*$"..".scale):
				switch_menu()


func check_event_point_in(zone: Control, global_event_pos : Vector2) -> bool:
	var mod_global_rect = zone.get_global_rect()
	mod_global_rect.position -= $"..".global_position
	mod_global_rect.size *= $"..".scale
	print(global_event_pos, mod_global_rect, $"..".global_position)
	if mod_global_rect.has_point(global_event_pos):
			return true
	for children in zone.get_children():
		if children is Control:
			Control
			if check_event_point_in(children, global_event_pos):
				return true
	return false


func _ready() -> void:
	fixated = ! fixated
	fixate_button.modulate = Color(1, 1, 1)
	_on_fixate_button_pressed()
	fixate_button.position.y = self.size.y - fixate_button.size.y
	menu_panel.position.y = self.size.y + 2
	menu_panel.position.x = -menu_panel.size.x + self.size.x


func _on_fixate_button_pressed() -> void:
	fixated = ! fixated
	if fixated:
		fixate_button.text = "lock"
	else:
		fixate_button.text = "unlock"
	# редактирование размещения кнопки
	fixate_button.size = fixate_button.get_minimum_size()
	fixate_button.position.x = -fixate_button.get_global_rect().size.x/$"..".scale.x - 2


func _on_locker_timeout() -> void:
	time_lock = false
	pass # Replace with function body.
