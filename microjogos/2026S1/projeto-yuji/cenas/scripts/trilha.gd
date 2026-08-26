extends StaticBody2D

func _ready() -> void:
	$CollisionShape2D.shape = SegmentShape2D.new()
	$Trilha.points = [Vector2.ZERO, Vector2.ZERO]
func setup_trail(pos:Vector2):
	$CollisionShape2D.shape.a = pos
	$Trilha.points = [pos, pos]
	$CollisionShape2D.shape.b = pos
	
func update_trail(pos:Vector2):
	$CollisionShape2D.shape.b = pos
	var new_points = $Trilha.points
	new_points[1] = pos
	$Trilha.points = new_points
