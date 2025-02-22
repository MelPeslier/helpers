@tool
class_name ForceTimeData
extends Resource

@export var distance: float = 0.0 : set = _set_distance
@export_range(0.01, 2.0, 0.001, "suffix:s") var time_to : float = 0.1 : set = _set_time_to

@export var force : float = 0.0


func _set_time_to(_time_to: float) -> void:
	time_to = _time_to
	_actualise_velocities()


func _set_distance(_distance: float) -> void:
	distance = _distance
	_actualise_velocities()


func _actualise_velocities() -> void:
	force = MovementMath.get_velocity_by_time(distance, time_to)
