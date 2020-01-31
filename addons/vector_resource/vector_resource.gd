class_name VectorResource tool extends Resource

export(Vector3) var value = Vector3() setget set_value
export(Vector3) var unit_value = Vector3() setget set_unit_value

export(bool) var snapped = true setget set_snapped
export(float) var grid_step = 16.0 setget set_grid_step
export(float) var max_length = 64.0  setget set_max_length

export(bool) var editor_show_normalized = false setget set_editor_show_normalized


func set_value(p_value):
	value = p_value
	unit_value = p_value.normalized()
	emit_signal("changed")


func set_unit_value(p_value):
	pass # restrict, handled in set_value


func set_max_length(p_max_length):
	max_length = max(0.0, p_max_length)
	emit_signal("changed")


func set_snapped(p_snapped):
	snapped = p_snapped
	emit_signal("changed")


func set_grid_step(p_grid_step):
	grid_step = max(0.0, p_grid_step)
	emit_signal("changed")


func set_editor_show_normalized(p_show):
	editor_show_normalized = p_show
	emit_signal("changed")
