@tool
class_name GravityDistanceData
extends ForceDistanceData


func _actualise_velocities() -> void:
	force = MovementMath.get_gravity_by_distance(height_peak, vel_x, distance_x_to_peak)
