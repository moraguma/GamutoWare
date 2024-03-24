extends Node2D
var rng = RandomNumberGenerator.new()
var R0 = rng.randf()
var G0 = rng.randf()
var B0 = rng.randf()
var R1 = rng.randf()
var G1 = rng.randf()
var B1 = rng.randf()
var c=[]
var n=6

func developer():
	$Cor1/Polygon2D.modulate = Color(c[1][0], c[1][1], c[1][2])
	$Cor2/Polygon2D.modulate = Color(c[2][0], c[2][1], c[2][2])
	$Cor3/Polygon2D.modulate = Color(c[3][0], c[3][1], c[3][2])
	$Cor4/Polygon2D.modulate = Color(c[4][0], c[4][1], c[4][2])
	$Cor5/Polygon2D.modulate = Color(c[5][0], c[5][1], c[5][2])

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(n+1):
		c.append([((n-i)*R0+i*R1)/n, ((n-i)*G0+i*G1)/n, ((n-i)*B0+i*B1)/n])
	$CorInicial/Polygon2D.modulate = Color(c[0][0], c[0][1], c[0][2])
	$CorFinal/Polygon2D.modulate = Color(c[n][0], c[n][1], c[n][2])
	#developer()
	c.remove_at(0)
	c.remove_at(n)
	c.shuffle()
	$CorUp/Polygon2D.modulate = Color(c[1][0], c[1][1], c[1][2])
	$CorLeft/Polygon2D.modulate = Color(c[2][0], c[2][1], c[2][2])
	$CorSpace/Polygon2D.modulate = Color(c[3][0], c[3][1], c[3][2])
	$CorRight/Polygon2D.modulate = Color(c[4][0], c[4][1], c[4][2])
	$CorDown/Polygon2D.modulate = Color(c[0][0], c[0][1], c[0][2])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
