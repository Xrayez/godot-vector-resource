class_name VectorResource tool extends Resource
#===============================================================================
# Public
#===============================================================================
# The following support vector swizzling to some extent.
# Properties represent hardcoded permutations of vector components.
#
func _get(p_property):
	v = unit_value if normalized else value
	# Ordered by most commonly used for perfomance reasons.
	if p_property == "xy":
		return Vector2(v.x, v.y)
	elif p_property == "xyz":
		return v
	elif p_property == "x":
		return v.x
	elif p_property == "y":
		return v.y
	elif p_property == "z":
		return v.z
	elif p_property == "yx":
		return Vector2(v.y, v.x)
	elif p_property == "xz":
		return Vector2(v.x, v.z)
	elif p_property == "zx":
		return Vector2(v.z, v.x)
	elif p_property == "zy":
		return Vector2(v.z, v.y)
	elif p_property == "yz":
		return Vector2(v.y, v.z)
	elif p_property == "yxz":
		return Vector3(v.y, v.x, v.z)
	elif p_property == "zxy":
		return Vector3(v.z, v.x, v.y)
	elif p_property == "xzy":
		return Vector3(v.x, v.z, v.y)
	elif p_property == "yzx":
		return Vector3(v.y, v.z, v.x)
	elif p_property == "zyx":
		return Vector3(v.z, v.y, v.x)

#===============================================================================
# Protected
#===============================================================================
# `value` and `unit_value` should not be used directly, use above properties.
# These are used by the editor and storage purposes.
#
export(Vector3) var value = Vector3() setget set_value
export(Vector3) var unit_value = Vector3() setget set_unit_value
var v = null # used by vector swizzling above

#===============================================================================
# Public
#===============================================================================
# The following properties can be set safely via code.
# The `value and `unit_value` will be updated automatically.
#
export(bool) var snapped = true setget set_snapped
export(float) var grid_step = 16.0 setget set_grid_step
export(bool) var normalized = false setget set_normalized
export(float) var max_length = 64.0  setget set_max_length

#===============================================================================
# Methods
#===============================================================================
func _init():
	if not is_connected("changed", self, "update"):
		connect("changed", self, "update")


func update():
	if snapped:
		value = value.snapped(Vector3(grid_step, grid_step, grid_step))
#	value = value.clamped(max_length) Vector3 doesn't support clamp...
	unit_value = value.normalized()


func set_value(p_value):
	value = p_value
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


func set_normalized(p_normalized):
	normalized = p_normalized
	emit_signal("changed")
