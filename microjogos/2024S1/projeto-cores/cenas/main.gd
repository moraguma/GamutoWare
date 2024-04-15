extends Node2D

signal win
signal lose

var rng = RandomNumberGenerator.new()
var R0 = rng.randf()
var G0 = rng.randf()
var B0 = rng.randf()
var R1 = rng.randf()
var G1 = rng.randf()
var B1 = rng.randf()
var c=[]
var n=6
var used=0
var shade=0.5
var up=0
var left=0
var space=0
var right=0
var down=0
var tentativa=[]
var resp=[]

func positionpolygon(arr, i, x):
	arr.append(Vector2((1+used)*x-i,-i))
	arr.append(Vector2((1+used)*x+i, -i))
	arr.append(Vector2((1+used)*x+i,+i))
	arr.append(Vector2((1+used)*x-i, +i))

func movepolygon():
	var arr = PackedVector2Array()
	positionpolygon(arr, 15, 40)
	for i in range(4):
		$Polygon15.polygon[i] = arr[i]
	arr=PackedVector2Array()
	positionpolygon(arr, 14, 40)
	for i in range(4):
		$Polygon14.polygon[i] = arr[i]
	arr=PackedVector2Array()
	positionpolygon(arr, 13, 40)
	for i in range(4):
		$Polygon13.polygon[i] = arr[i]
	arr=PackedVector2Array()


func reset():
	$Cor1/Polygon2D.modulate = Color(1, 1, 1)
	$Cor2/Polygon2D.modulate = Color(1, 1, 1)
	$Cor3/Polygon2D.modulate = Color(1, 1, 1)
	$Cor4/Polygon2D.modulate = Color(1, 1, 1)
	$Cor5/Polygon2D.modulate = Color(1, 1, 1)
	$CorUp/Polygon2D.modulate = Color(c[0][0], c[0][1], c[0][2])
	$CorLeft/Polygon2D.modulate = Color(c[1][0], c[1][1], c[1][2])
	$CorSpace/Polygon2D.modulate = Color(c[2][0], c[2][1], c[2][2])
	$CorRight/Polygon2D.modulate = Color(c[3][0], c[3][1], c[3][2])
	$CorDown/Polygon2D.modulate = Color(c[4][0], c[4][1], c[4][2])
	used=-1
	up=0
	left=0
	space=0
	right=0
	down=0
	tentativa=[]
	$Sprite2D.modulate = Color(1, 1, 1, 0)
	$Sprite2D2.modulate = Color(1, 1, 1, 1)
	$Sprite2D3.modulate = Color(1, 1, 1, 1)
	$Sprite2D4.modulate = Color(1, 1, 1, 1)
	$Sprite2D5.modulate = Color(1, 1, 1, 1)
	$Sprite2D6.modulate = Color(1, 1, 1, 1)


func put_color(i):
	tentativa.append(i)
	if used==0:
		$Cor1/Polygon2D.modulate = Color(c[i][0], c[i][1], c[i][2])
	elif used==1:
		$Cor2/Polygon2D.modulate = Color(c[i][0], c[i][1], c[i][2])
	elif used==2:
		$Cor3/Polygon2D.modulate = Color(c[i][0], c[i][1], c[i][2])
	elif used==3:
		$Cor4/Polygon2D.modulate = Color(c[i][0], c[i][1], c[i][2])
	elif used==4:
		$Cor5/Polygon2D.modulate = Color(c[i][0], c[i][1], c[i][2])
		if tentativa==resp:
			emit_signal("win")
			$Sprite2D.modulate = Color((R0+R1)/2, (G0+G1)/2, (B0+B1)/2, 1)
			$Polygon13.modulate = Color(0,0,0,0)
			$Polygon14.modulate = Color(0,0,0,0)
			$Polygon15.modulate = Color(0,0,0,0)
			$Sprite2D2.modulate = Color(1, 1, 1, 0)
			$Sprite2D3.modulate = Color(1, 1, 1, 0)
			$Sprite2D4.modulate = Color(1, 1, 1, 0)
			$Sprite2D5.modulate = Color(1, 1, 1, 0)
			$Sprite2D6.modulate = Color(1, 1, 1, 0)
			$AudioStreamPlayer2D.play()
		else:
			reset()
	movepolygon()
	used=used+1




# Called when the node enters the scene tree for the first time.
func _ready():
	'''if (abs(R0-R1)<0.1) && (abs(B0-B1)<0.1) && (abs(G0-G1)<0.1):
		R0 = rng.randf()
		G0 = rng.randf()
		B0 = rng.randf()
		R1 = rng.randf()
		G1 = rng.randf()
		B1 = rng.randf()'''
	print(R0*256)
	print(G0*256)
	print(B0*256)
	print(R1*256)
	print(G1*256)
	print(B1*256)
	for i in range(n+1):
		c.append([((n-i)*R0+i*R1)/n, ((n-i)*G0+i*G1)/n, ((n-i)*B0+i*B1)/n, i])
	$CorInicial/Polygon2D.modulate = Color(c[0][0], c[0][1], c[0][2])
	$CorFinal/Polygon2D.modulate = Color(c[n][0], c[n][1], c[n][2])
	#developer()
	c.remove_at(0)
	c.remove_at(n-1)
	c.shuffle()
	for i in range(1,n):
		for j in range(n-1):
			if c[j][3]==i:
				resp.append(j)
	$CorUp/Polygon2D.modulate = Color(c[0][0], c[0][1], c[0][2])
	$CorLeft/Polygon2D.modulate = Color(c[1][0], c[1][1], c[1][2])
	$CorSpace/Polygon2D.modulate = Color(c[2][0], c[2][1], c[2][2])
	$CorRight/Polygon2D.modulate = Color(c[3][0], c[3][1], c[3][2])
	$CorDown/Polygon2D.modulate = Color(c[4][0], c[4][1], c[4][2])


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_UP and up==0:
			$CorUp/Polygon2D.modulate = Color(c[0][0], c[0][1], c[0][2], shade)
			#$Sprite2D2.modulate = Color(c[0][0], c[0][1], c[0][2], shade)
			$Sprite2D2.modulate = Color(1, 1, 1, 0)
			up=up+1
			put_color(0)
		elif event.pressed and event.keycode == KEY_LEFT and left==0:
			$CorLeft/Polygon2D.modulate = Color(c[1][0], c[1][1], c[1][2], shade)
			#$Sprite2D3.modulate = Color(c[1][0], c[1][1], c[1][2], shade)
			$Sprite2D3.modulate = Color(1, 1, 1, 0)
			left=left+1
			put_color(1)
		elif event.pressed and event.keycode == KEY_SPACE and space==0:
			$CorSpace/Polygon2D.modulate = Color(c[2][0], c[2][1], c[2][2], shade)
			#$Sprite2D4.modulate = Color(c[2][0], c[2][1], c[2][2], shade)
			$Sprite2D4.modulate = Color(1, 1, 1, 0)
			space=space+1
			put_color(2)
		elif event.pressed and event.keycode == KEY_RIGHT and right==0:
			$CorRight/Polygon2D.modulate = Color(c[3][0], c[3][1], c[3][2], shade)
			#$Sprite2D5.modulate = Color(c[3][0], c[3][1], c[3][2], shade)
			$Sprite2D5.modulate = Color(1, 1, 1, 0)
			right=right+1
			put_color(3)
		elif event.pressed and event.keycode == KEY_DOWN and down==0:
			$CorDown/Polygon2D.modulate = Color(c[4][0], c[4][1], c[4][2], shade)
			#$Sprite2D6.modulate = Color(c[4][0], c[4][1], c[4][2], shade)
			$Sprite2D6.modulate = Color(1, 1, 1, 0)
			down=down+1
			put_color(4)
		elif event.pressed and event.keycode == KEY_R:
			reset()
			used=used+1



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

