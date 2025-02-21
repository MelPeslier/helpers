class_name OffsetHelper
extends Node

## The node you want to change / move / etc...
var node: Node
## The property you want to alter
var property: String = ""
## The stocked offset variable of the property your tweaking
var offset_var : Variant = null


## Use to create an offset_helper node, don't forget to add it to your scene and keep a reference
static func create_new(_node: Node, _property: String) -> OffsetHelper:
	var _offset_helper := OffsetHelper.new()
	_offset_helper.node = _node
	_offset_helper.property = _property
	_offset_helper.offset_var = _offset_helper._get_zero_by_type()
	return _offset_helper


## Change the value on node, based on offset
func update_offset(_value: Variant) -> void:
	var _origin: Variant = node.get(property)
	node.set(property, _origin - offset_var )
	offset_var = _value
	_origin = node.get(property)
	node.set(property, _origin + offset_var )


## Bring it back to ZERO
func reset(_kill: bool = false, _duration: float = 0.3) -> void:
	var tween: Tween = create_tween()
	tween.tween_method( update_offset, offset_var, _get_zero_by_type(), _duration)
	if not _kill : return
	await tween.finished
	queue_free()


## Initialise the property based on type
## If you get an error here, add the property initialisations to the code
func _get_zero_by_type() -> Variant:
	var zero : Variant = null
	match typeof(node.get(property)):
		TYPE_FLOAT:
			zero = 0.0
		TYPE_INT:
			zero = 0
		TYPE_VECTOR2:
			zero = Vector2.ZERO
		TYPE_VECTOR2I:
			zero = Vector2i.ZERO
		TYPE_COLOR:
			zero = Color.BLACK
		TYPE_VECTOR3:
			zero = Vector3.ZERO
		TYPE_VECTOR3I:
			zero = Vector3i.ZERO
	if zero == null: push_warning("property unknown, please add it if missing")
	return zero
