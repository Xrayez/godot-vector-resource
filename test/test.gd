extends Node

export(Resource) var vector = preload("res://vector.tres")

func _ready():
	print("vector.xy == %s" % [vector.xy])
	print("vector.xyz == %s" % [vector.xyz])
