extends EditorInspectorPlugin


func _can_handle(object: Object) -> bool:
	return false


func _parse_begin(object: Object) -> void:
	var cd := CurveDisplay.create_new()
	add_custom_control(cd)
