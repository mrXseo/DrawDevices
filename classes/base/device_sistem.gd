extends DeviceSimplest

"""Сложный компонент системы устройства."""
class_name DeviceSistem


var devices : Array[DeviceSimplest] = []

func add_device( new_device : DeviceSimplest ) -> void:
	devices.append(new_device)
	add_child(new_device)

func in_check(point : Vector2) -> bool:
	if local_space.in_check(point):
		return true
	for device in devices:
		if device.in_check(point):
			return true
	return false
