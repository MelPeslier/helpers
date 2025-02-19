@tool
extends EditorPlugin

const TWEEN_HELPER_NAME = "TweenHelper"
const TWEEN_HELPER_PATH = "res://addons/helpers/tween/tween_helper.gd"


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_autoload_singleton(TWEEN_HELPER_NAME, TWEEN_HELPER_PATH)
	pass


func _exit_tree() -> void:
	remove_autoload_singleton(TWEEN_HELPER_NAME)
	pass
