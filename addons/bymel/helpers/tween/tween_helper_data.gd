@tool
class_name TweenHelperData
extends Curve
## Create your own curves or use the [Tween] predefined curves
##
## A helper to use with your [Tween] to alter values however you want
## Or to use for sampling the delay to call each tweening
## Example use for [b]tweening[/b] and [b]delay[/b]
## [codeblock]
## @export var interval_curve : TweenHelper
## @export var property_curve : TweenHelper
## @export var array : Array[Node2D]
## func tweening() -> void:
##    var tween : Tween = create_tween()
##    tween.set_parallel() # Set to parallel so you customize delays with set_delay() 
##    for i: int in array.length():
##       var n : Node2D = array[i]
##       var delay := interval_curve.sample_interval(i, array.length())
##       # Using Tweens
##       tween.tween_property(n, "position:x", 0.0, interval_curve.duration).set_delay(delay)
##       # Custom property tweening
##       property_curve.interpolate(tween, n, "position:x", 0.0, 60.0, delay)
## [/codeblock]

## Tweening duration
@export_range(0.0, 3.0, 0.001, "or_greater", "suffix:s") var duration : float = 1.0

## Generate curve on ease / trans changed and when reloading the scene !
## Be sure to check this if you want to set the curve manually and stop using the tween presets !
@export var use_custom_curve : bool = false : set = _set_use_custom_curve

@export var trans_type : Tween.TransitionType : set = _set_trans_type

@export var ease_type : Tween.EaseType : set = _set_ease_type
@export_group("dd")


#region public
## For fast kill tween, create a new, and set parralel, easing and transition type in 1 line
func kill_and_create(_node: Node, _tween: Tween, _parallel: bool = false) -> Tween:
	if _tween and _tween.is_running():
		_tween.kill()
	_tween = _node.create_tween().set_parallel(_parallel)
	set_data(_tween)
	return _tween


## For fast easing and trans
func set_data(_tween: Tween) -> void:
	_tween.set_ease(ease_type)
	_tween.set_trans(trans_type)


## Return the interval to call in sequence
## Example in the [TweenHelper] 
func sample_interval(_point_index: int, _point_count: int, _as_coef: bool = false) -> float:
	var x : float = remap( float(_point_index), 0.0, float(_point_count-1), 0.0, 1.0 )
	if _point_count == 1: x = 0.0
	var y: float = sample(x)
	if not _as_coef:
		y *= duration
	return y


## Interpolate your node value using the curve, good for custom curves, if you are just using the normal tweens, you better use
## the normal tween_property etc...
func interpolate(_tween: Tween, _node: Node, _property: NodePath, _start : Variant, _end : Variant, _delay: float) -> void:
	_tween.tween_method(_process_interpolation.bind(_node, _property, _start, _end), 0.0, 1.0, duration).set_delay(_delay).set_trans(Tween.TRANS_LINEAR)
#endregion


#region private
func _init() -> void:
	#use_custom_curve = true
	trans_type = Tween.TRANS_SINE
	ease_type = Tween.EASE_OUT


func _process_interpolation(_progress : float, _node: Node, _property: NodePath, _start: Variant, _end : Variant) -> void:
	var y : float = _start + (_end - _start) * sample(_progress)
	var t : Tween = _node.create_tween()
	t.tween_property(_node, _property, y, 0.0)



func _update_curve():
	if use_custom_curve: 
		return
	clear_points()
	min_value = 0.0
	max_value = 1.0
	for i: int in range(bake_resolution + 1):
		var t = i / float(bake_resolution)  # Position normalisée de 0 à 1
		var y = Tween.interpolate_value(0.0, 1.0, t, 1.0, trans_type, ease_type)
		if y > max_value:
			max_value = y
		if y < min_value:
			min_value = y
		add_point(Vector2(t, y))


func _set_use_custom_curve(_use: bool) -> void:
	if not use_custom_curve and _use:
		clear_points()
		min_value = 0.0
		max_value = 1.0
		add_point(Vector2.ZERO)
		add_point(Vector2.ONE)
		return
	use_custom_curve = _use
	_update_curve()


func _set_ease_type(_ease_type: Tween.EaseType) -> void:
	ease_type = _ease_type
	_update_curve()


func _set_trans_type(_trans_type: Tween.TransitionType) -> void:
	trans_type = _trans_type
	_update_curve()

#endregion
