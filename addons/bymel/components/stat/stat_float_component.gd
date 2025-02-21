class_name StatFloatComponent
extends Node

### Can be used for life, energy, mana or anything you need !

signal depleted()
signal replenished()
signal changed(_new_value: float, _old_value: float, _max_value: float)
signal max_changed(_new_max_value: float, _old_max_value: float, _value: float)


@export var max_value: float : set = _set_max_value
@export var value: float : set = _set_value


#region public
func gain(_bonus: float) -> void:
	value += _bonus


func lose(_malus: float) -> void:
	value -= _malus


func have(_value: float) -> bool:
	return _value <= value


func is_empty() -> bool:
	return is_zero_approx(value);


func is_full() -> bool:
	return is_equal_approx(value, max_value)


func gain_max(_bonus: float) -> void:
	max_changed.emit(max_value, max_value + _bonus, value)
	max_value += _bonus


func lose_max(_malus: float) -> void:
	max_changed.emit(max_value, max_value - _malus, value)
	max_value -= _malus
#endregion


#region private
func _set_value(_value: float) -> void:
	var old_value : float = value
	value = clampf(_value, 0, max_value)
	changed.emit(value, old_value, max_value)
	if is_empty(): depleted.emit()
	if is_full(): replenished.emit()


func _set_max_value(_max_value: float) -> void:
	var old_value : float = max_value
	max_value = _max_value
	max_changed.emit(max_value, old_value, value)
#endregion
