extends EditorInspectorPlugin


#func _can_handle(object: Object) -> bool:
	#return object.get("property_display_data") != null


#func _parse_begin(object: Object) -> void:
	#var pd := PropertyDisplay.create_new()
	#add_custom_control(pd)
	#object.property_display = pd
	#object._property_display_update()
	#var pdd : PropertyDisplayData = object.get("property_display_data")
	#if pdd == null:
		#print("Erreur : property_display_data est null")
		#return
#
	#if not (pdd is PropertyDisplayData):
		#print("Erreur : property_display_data n'est pas du type attendu")
		#return
#
	#if not pdd.has("displays"):
		#print("Erreur : displays n'existe pas sur pdd")
		#return
	#print(pdd.displays.size())
	#var size: int = pdd.properties.size()
	#pdd.displays.resize(size)
	#for i: int in size:
		#var pd := PropertyDisplay.create_new()
		#add_custom_control(pd)
		#pdd.displays[i] = pd
