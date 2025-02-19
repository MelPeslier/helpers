extends Node

@export var thd_default : TweenHelperData

# For Node2D and Control
var node: CanvasItem
var tween: Tween

#
#func interpolate(_thd : TweenHelperData = null, _duration : float = -1.0) -> void:
	#if not _thd: # Ensure you have a TweenHelperData
		#if not thd_default:
			#thd_default = TweenHelperData.new()
		#_thd = thd_default
	#
	#if tween and tween.is_running():
		#tween.kill()
	#tween = _node.createtween().set_parallel(_parallel)
	#_thd.set_data(tween)
		#reset()
		#tween.kill()
	#
	#tween = create_tween()
	#
	#if _duration < 0.0:
		#_duration = _thd.duration
	#var at_pick_delay : float = _duration * _thd.at_pick_time_coef
	#tween.tween_callback( shake_at_pick.emit ).set_delay( at_pick_delay )
	#tween.parallel().tween_method(_update_offset.bind(_thd), 0.0, 1.0, _duration)
	#tween.tween_callback( shake_finished.emit )
	#if _thd.reset_at_end:
		#tween.tween_callback( shake_stoped.emit )
#
