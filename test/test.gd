extends Node

export(Resource) var vector = preload("res://vector.tres")


func _ready():
	debug_print()
	vector.connect("changed", self, "debug_print")


func debug_print():
	print("vector.x == %s" % [vector.x])
	print("vector.y == %s" % [vector.y])
	print("vector.z == %s" % [vector.z])
	print("vector.xy == %s" % [vector.xy])
	print("vector.xyz == %s" % [vector.xyz])
