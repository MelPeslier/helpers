class_name PlatformerVelocityComponent
extends Node


@export var speed_max: float = 500.0 : set = _set_speed_max
@export_range(0.01, 2.0, 0.001, "suffix:s") var accel_time : float = 0.3 : set = _set_accel_time
@export_range(0.01, 2.0, 0.001, "suffix:s") var decel_time : float = 0.1 : set = _set_decel_time


var speed : float = 0
var accel : float = 0
var decel : float = 0


func _ready() -> void:
	_actualise_velocities()

#region public
## Call it constantly
func custom_process(delta: float, _dir : float) -> void:
	var no_dir: bool = is_zero_approx(_dir)
	var not_same_dir: bool = not is_equal_approx( signf(speed),  signf(_dir) )
	if no_dir or not_same_dir:
		decelerate(delta, _dir)
	if not no_dir:
		accelerate(delta, _dir)


func move(character_body: CharacterBody2D) -> void:
	character_body.velocity.x = speed
	# TODO : rajout du check si dodge_corner_component, utiliser si présent et que besoin de dodge
	character_body.move_and_slide()


func accelerate(delta: float, _dir: float) -> void:
	speed = clampf( speed + accel * _dir * delta, - speed_max * absf(_dir), speed_max * absf(_dir) )


func decelerate(delta: float, _dir: float) -> void:
	speed = maxf( abs(speed) - decel * delta, 0 ) * signf(speed)


#func _decelerate_on_opposite_dir(delta: float, _dir: float) -> void:
	#if speed > 0 and _dir < 0:
		#speed = maxf( speed - decel * delta, 0 )
	#elif speed < 0 and _dir > 0:
		#speed = minf( speed + decel * delta, 0 )
	# Replaced by : ?
	#if is_zero_approx(_dir) or not is_equal_approx( signf(speed),  signf(_dir) ):
		#decelerate(delta, _dir)
#endregion


#region private
func _set_accel_time(_accel_time: float) -> void:
	accel_time = _accel_time
	accel = MovementMath.get_velocity_by_time(speed_max, accel_time)


func _set_decel_time(_decel_time: float) -> void:
	decel_time = _decel_time
	decel = MovementMath.get_velocity_by_time(speed_max, decel_time)


func _set_speed_max(_speed_max: float) -> void:
	speed_max = _speed_max
	_actualise_velocities()


func _actualise_velocities() -> void:
	accel = accel
	decel = decel
#endregion
