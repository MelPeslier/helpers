class_name StatIntComponent
extends Node

### Can be used for life, energy, mana or anything you need !

signal depleted()
signal replenished()
signal changed(_new_value: int, _old_value: int, _max_value: int)
signal max_changed(_new_max_value: int, _old_max_value: int, _value: int)


@export var max_value: int : set = _set_max_value
@export var value: int : set = _set_value


#region public
func gain(_bonus: int) -> void:
	value += _bonus


func lose(_malus: int) -> void:
	value -= _malus


func have(_value: int) -> bool:
	return _value <= value


func is_empty() -> bool:
	return value == 0;


func is_full() -> bool:
	return value == max_value


func gain_max(_bonus: int) -> void:
	max_changed.emit(max_value, max_value + _bonus, value)
	max_value += _bonus


func lose_max(_malus: int) -> void:
	max_changed.emit(max_value, max_value - _malus, value)
	max_value -= _malus
#endregion


#region private
func _set_value(_value: int) -> void:
	var old_value : int = value
	value = clampi(_value, 0, max_value)
	changed.emit(value, old_value, max_value)
	if is_empty(): depleted.emit()
	if is_full(): replenished.emit()


func _set_max_value(_max_value: int) -> void:
	var old_value : int = max_value
	max_value = _max_value
	max_changed.emit(max_value, old_value, value)
#endregion
