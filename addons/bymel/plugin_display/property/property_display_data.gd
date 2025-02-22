class_name PropertyDisplayData
extends Resource

@export var properties : Array[String] = []

var displays: Array[PropertyDisplay] = []


func update_property(_name: String, _value: String) -> void:
	print(displays.size())
	var i: int = properties.find(_name)
	if i == -1: 
		push_warning("invalide property name")
		return
	displays[i].update_name(_name)
	displays[i].update_value(_value)
