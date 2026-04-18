extends MultiMeshInstance2D
@export var obstacle : PackedScene
@export var path : Path2D
@export var path_radius = 150
@export var colision_layer : StaticBody2D
const WIDTH = 1920
const HEIGHT = 1080

func _ready() -> void:
	var shape = RectangleShape2D.new()
	shape.size = Vector2(60, 60)
	for i in multimesh.instance_count:
		var location = Vector2(randi_range(0,WIDTH),randi_range(0,HEIGHT))
		var distance_to_path = path.curve.get_closest_point(location).distance_to(location)
		while distance_to_path < path_radius:
			location = Vector2(randi_range(0,WIDTH),randi_range(0,HEIGHT))
			distance_to_path = path.curve.get_closest_point(location).distance_to(location)
		var rot = randf() * PI
		var transf = Transform2D(0, location).rotated_local(rot)
		multimesh.set_instance_transform_2d(i, transf)
		var rect_col = CollisionShape2D.new()
		rect_col.shape = shape
		rect_col.position = location
		rect_col.rotation = rot
		colision_layer.add_child(rect_col)
