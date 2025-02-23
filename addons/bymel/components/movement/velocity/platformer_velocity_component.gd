@tool
class_name PlatformerVelocityComponent
extends Node

@export var speed_max: ForceTimeData

@export var accel : ForceTimeData
@export var decel : ForceTimeData
@export var gravity : ForceData

var speed : float = 0.0
var gravity_final : float = 0.0

func _ready() -> void:
	if speed_max:
		speed_max.force_changed.connect(_on_speed_max_force_changed)
	_actualise_velocities()

#region public
## Call it constantly
func custom_process(delta: float, _dir : float) -> void:
	var no_dir: bool = is_zero_approx(_dir)
	var not_same_dir: bool = speed !=0 and not is_equal_approx( signf(speed),  signf(_dir) )
	if no_dir or not_same_dir:
		decelerate(delta)
	if not no_dir:
		accelerate(delta, _dir)


func move(character_body: CharacterBody2D) -> void:
	character_body.velocity.x = speed
	# TODO : rajout du check si dodge_corner_component, utiliser si présent et que besoin de dodge
	character_body.move_and_slide()


func accelerate(delta: float, _dir: float) -> void:
	speed = clampf( speed + accel.force * _dir * delta, -speed_max.force, speed_max.force)
	print(speed)


func decelerate(delta: float) -> void:
	speed = maxf( abs(speed) - decel.force * delta, 0 ) * signf(speed)


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


func _on_speed_max_force_changed(_new_force: float) -> void:
	_actualise_velocities()


func _actualise_velocities() -> void:
	if accel:
		accel.distance = speed_max.force
	if decel:
		decel.distance = speed_max.force
	if gravity is GravityTimeData:
		gravity.distance = speed_max.force
	elif gravity is GravityDistanceData:
		gravity.vel_x = speed_max.force
#endregion
