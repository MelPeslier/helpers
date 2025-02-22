@tool
class_name GravityTimeData
extends ForceTimeData


func _actualise_velocities() -> void:
	force = MovementMath.get_gravity_by_time(distance, time_to)
