@tool
class_name ForceDistanceData
extends ForceData

@export var height_peak : float : set = _set_height_peak
@export var vel_x : float : set = _set_vel_x
@export var distance_x_to_peak : float : set = _set_distance_x_to_peak



func _set_height_peak(_height_peak: float) -> void:
	height_peak = _height_peak
	_actualise_velocities()


func _set_vel_x(_vel_x: float) -> void:
	vel_x = _vel_x
	_actualise_velocities()


func _set_distance_x_to_peak(_distance_x_to_peak: float) -> void:
	distance_x_to_peak = _distance_x_to_peak
	_actualise_velocities()


func _actualise_velocities() -> void:
	force = MovementMath.get_jump_by_distance(height_peak, vel_x, distance_x_to_peak)
