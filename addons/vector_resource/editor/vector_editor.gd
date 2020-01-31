tool extends Control

onready var editor = find_node("plane_editor")
var edited_vector: VectorResource setget set_edited_vector


func set_edited_vector(p_edited_vector):
	edited_vector = p_edited_vector
	editor = find_node("plane_editor")
	editor.edited_vector = edited_vector
	$body/view_buttons/unit.pressed = edited_vector.editor_show_normalized


func _on_xy_pressed():
	editor.plane = VectorEditor.VectorPlane.XY


func _on_xz_pressed():
	editor.plane = VectorEditor.VectorPlane.XZ


func _on_yz_pressed():
	editor.plane = VectorEditor.VectorPlane.YZ


func _on_unit_toggled(button_pressed):
	editor.edited_vector.editor_show_normalized = button_pressed
