@tool
extends EditorPlugin


const TWEEN_HELPER_NAME: String = "TweenHelper"
const TWEEN_HELPER_PATH: String = "res://addons/bymel/helpers/tween/tween_helper.gd"


const CURVE_DISPLAY_PLUGIN_PATH : String = "res://addons/bymel/plugin_display/curve/curve_display_plugin.gd"
var curve_display_plugin : EditorInspectorPlugin = null

const PROPERTY_DISPLAY_PLUGIN_PATH : String = "res://addons/bymel/plugin_display/property/property_display_plugin.gd"
var property_display_plugin : EditorInspectorPlugin = null


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_autoload_singleton(TWEEN_HELPER_NAME, TWEEN_HELPER_PATH)
	curve_display_plugin = preload(CURVE_DISPLAY_PLUGIN_PATH).new()
	add_inspector_plugin(curve_display_plugin)
	property_display_plugin = preload(PROPERTY_DISPLAY_PLUGIN_PATH).new()
	add_inspector_plugin(property_display_plugin)


func _exit_tree() -> void:
	remove_autoload_singleton(TWEEN_HELPER_NAME)
	remove_inspector_plugin(curve_display_plugin)
	remove_inspector_plugin(property_display_plugin)
