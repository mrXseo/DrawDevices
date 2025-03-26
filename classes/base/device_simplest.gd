extends Node2D

"""Простейший компонент системы устройства."""
class_name DeviceSimplest

"""Имеет некоторое специальное имя устройства вроде "C2000", которое нужно для сверки типов."""
var sistemed_name : String = ""
"""Имеет некоторое (опционально уникальное) локальное имя."""
var open_name : String = ""

"""Любое устройство находится в пространстве и занимает некоторое место."""
var local_space : ObjectSpace = ObjectSpace.new()
"""Любое устройство имеет несёт какую-либо информационную нагрузку."""
var data : Dictionary = {}


func set_data(new_data : Dictionary) -> void:
	data = new_data

func get_names() -> Array[String]: 
	return [sistemed_name, open_name]

func get_open_name() -> String:
	return open_name

func get_sistemed_name() -> String:
	return sistemed_name

func get_data() -> Dictionary:
	return data

func in_check(point : Vector2) -> bool:
	return local_space.in_check(point)


func _ready() -> void:
	add_child(local_space)
