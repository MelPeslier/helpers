class_name PropertyDisplay
extends HBoxContainer

const PROPERTY_DISPLAY = preload("res://addons/bymel/plugin_display/property/property_display.tscn")


@onready var name_label: Label = %NameLabel
@onready var value_label: Label = %ValueLabel


static func create_new() -> PropertyDisplay:
	var pd: PropertyDisplay = PROPERTY_DISPLAY.instantiate()
	return pd


func update_name(_name: String) -> void:
	name_label.text = _name


func update_value(_value: String) -> void:
	value_label.text = _value
