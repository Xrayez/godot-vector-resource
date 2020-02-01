extends Node

export(Resource) var vector = preload("res://vector.tres")


func _ready():
	debug_print()
	vector.connect("changed", self, "debug_print")

	test()


func debug_print():
	print("vector.x == %s" % [vector.x])
	print("vector.y == %s" % [vector.y])
	print("vector.z == %s" % [vector.z])
	print("vector.xy == %s" % [vector.xy])
	print("vector.xyz == %s" % [vector.xyz])
	print("\n")


func test():
	assert(is_equal_approx(vector.x, -0.301511))
	assert(is_equal_approx(vector.y, -0.301511))
	assert(is_equal_approx(vector.z, 0.904534))
	assert(vector.xy.is_equal_approx(Vector2(-0.301511, -0.301511)))
	assert(vector.xyz.is_equal_approx(Vector3(-0.301511, -0.301511, 0.904534)))

	vector.normalized = false
	vector.xy = Vector2(64, 64)

	assert(vector.xy == Vector2(64, 64))
	assert(vector.xyz == Vector3(64, 64, 48))
