class_name PropertyDisplay
extends Control

const PROPERTY_DISPLAY = preload("res://addons/bymel/plugin_display/property/property_display.tscn")


static func create_new() -> PropertyDisplay:
	var pd: PropertyDisplay = PROPERTY_DISPLAY.instantiate()
	return pd
