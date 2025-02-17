class_name MovementMath
extends Node


static func get_velocity_by_time(_distance: float, _time_to: float) -> float:
	#return (2.0 * _distance) / _time_to ??
	return _distance / _time_to


static func get_gravity_by_time(_distance: float, _time_to: float) -> float:
	#return _distance / (_time_to * _time_to) ??
	return ((2.0 * _distance) / (_time_to * _time_to))
