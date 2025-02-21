extends Sprite2D


var offset_helper : OffsetHelper = null
var oh_scale: OffsetHelper = null
var oh_pos_2: OffsetHelper = null

var s: float = 1.0
var x: float = 0.0
var x_2: float = 0.0
var time: float = 0.0

# Here it is, you can animate a same property a thousand of times simultaneously,
# it wil all accumulate, never break, Let's use it for damped oscillators and tweens

func _ready() -> void:
	offset_helper = OffsetHelper.create_new(self, "position")
	add_child(offset_helper)
	oh_pos_2 = OffsetHelper.create_new(self, "position")
	add_child(oh_pos_2)
	oh_scale = OffsetHelper.create_new(self, "scale")
	add_child(oh_scale)


func _process(delta: float) -> void:
	time += delta
	x = sin(time) * 300.0
	offset_helper.update_offset(Vector2(x, 0.0) )
	
	x_2 = sin(time * 10.0) * 50.0
	oh_pos_2.update_offset(Vector2(x_2, 0.0) )
	
	s = sin(time * 10.0) * 0.2
	oh_scale.update_offset(Vector2(s, -s) )
