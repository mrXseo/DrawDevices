extends Node2D

class_name ObjectSpace

var hight : float = 0
var width : float = 0

func set_hight(new_hight : int) -> void:
	hight = new_hight

func set_width(new_width : int) -> void:
	width = new_width

func in_check(point : Vector2) -> bool:
	var X = point.x 
	var Y = point.y
	if global_position.x <= X and X < global_position.x+width:
		if global_position.y <= Y and Y < global_position.y+hight:
			return true
	return false
