class_name MovementMath
extends Node

#region Time
static func get_velocity_by_time(_distance: float, _time_to: float) -> float:
	return _distance / _time_to


static func get_gravity_by_time(_distance: float, _time_to: float) -> float:
	return ((2.0 * _distance) / (_time_to * _time_to))


static func get_jump_velocity_by_time(_distance: float, _time_to: float) -> float:
	return (2.0 * _distance) / _time_to
#endregion Time


#region Distance
static func get_jump_by_distance(_height_peak : float, _vel_x: float, _distance_x_to_peak: float) -> float:
	return ( 2.0 * _height_peak * _vel_x) / _distance_x_to_peak;

static func get_gravity_by_distance(_height_peak : float, _vel_x: float, _distance_x_to_peak: float) -> float:
	return ( 2.0 * _height_peak * (_vel_x * _vel_x) ) / (_distance_x_to_peak * _distance_x_to_peak)
#endregion Distance
