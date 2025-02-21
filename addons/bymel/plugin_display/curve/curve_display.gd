class_name CurveDisplay
extends Control

const CURVE_DISPLAY = preload("res://addons/bymel/plugin_display/curve/curve_display.tscn")


static func create_new() -> CurveDisplay:
	var cd: CurveDisplay = CURVE_DISPLAY.instantiate()
	return cd
