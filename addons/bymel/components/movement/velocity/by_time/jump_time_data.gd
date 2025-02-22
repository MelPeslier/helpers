@tool
class_name JumpTimeData
extends ForceTimeData


func _actualise_velocities() -> void:
	force = MovementMath.get_jump_velocity_by_time(distance, time_to)
