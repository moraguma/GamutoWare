extends StaticBody2D

func _ready() -> void:
	$CollisionShape2D.shape = SegmentShape2D.new()
	$Trilha.points = [Vector2.ZERO, Vector2.ZERO]
func setup_trail(pos:Vector2):
	$CollisionShape2D.shape.a = pos
	$Trilha.points[0] = pos
	$CollisionShape2D.shape.b = pos
	$Trilha.points[1] = pos
	
func update_trail(pos:Vector2):
	$CollisionShape2D.shape.b = pos
	$Trilha.points[1] = pos
