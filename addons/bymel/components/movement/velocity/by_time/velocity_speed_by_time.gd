class_name VelocitySpeedByTime
extends Resource

@export var speed_max: float = 500.0 : set = _set_speed_max
@export_range(0.01, 2.0, 0.001, "suffix:s") var accel_time : float = 0.3 : set = _set_accel_time
@export_range(0.01, 2.0, 0.001, "suffix:s") var decel_time : float = 0.1 : set = _set_decel_time


var speed : float = 0.0
var accel : float = 0.0
var decel : float = 0.0


func _set_accel_time(_accel_time: float) -> void:
	accel_time = _accel_time
	_actualise_velocities()


func _set_decel_time(_decel_time: float) -> void:
	decel_time = _decel_time
	_actualise_velocities()


func _set_speed_max(_speed_max: float) -> void:
	speed_max = _speed_max
	_actualise_velocities()


func _actualise_velocities() -> void:
	accel = MovementMath.get_velocity_by_time(speed_max, accel_time)
	decel = MovementMath.get_velocity_by_time(speed_max, decel_time)
