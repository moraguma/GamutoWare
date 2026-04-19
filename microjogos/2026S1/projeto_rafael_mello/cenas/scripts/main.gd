extends Node2D

var s1_scene = preload("res://microjogos/2026S1/projeto_rafael_mello/cenas/Shooter1.tscn")
var s2_scene = preload("res://microjogos/2026S1/projeto_rafael_mello/cenas/Shooter2.tscn")

func _ready():
	Minigames.register_win(self)
	
	$Back.position.x == randi() % 101 - 50
	$Back.position.y == randi() % 101 - 50
	var id = randi() % 4
	
	if id == 0:
		instantiate_shooter2(Vector2(1880, 1040), Vector2(0,-1)	, 200, 600, 0, 1)
		instantiate_shooter2(Vector2(40, 40)	, Vector2(0,1)	, 200, 600, 1, 2)
		instantiate_shooter2(Vector2(40, 1040)	, Vector2(1,0)	, 400, 600, 2, 3)
		instantiate_shooter2(Vector2(1880, 40)	, Vector2(-1,0)	, 300, 600, 2, 3)
	elif id == 1:
		instantiate_shooter1(Vector2(1880, 540), Vector2.UP, 4, 100, 600, 0, 60)
		instantiate_shooter1(Vector2(40, 360), Vector2.DOWN, 2, 50, 600, 0, 0)
		instantiate_shooter1(Vector2(40, 720), Vector2.DOWN, 2, 50, 600, 0, 0)
	elif id == 2:
		instantiate_shooter1(Vector2(815, 40), Vector2.LEFT, 3, 100, 600, 0, 0)
		instantiate_shooter1(Vector2(1105, 40), Vector2.LEFT, 3, 100, 600, 0, 0)
		instantiate_shooter1(Vector2(40, 730), Vector2.DOWN, 3, 80, 600, 0, 0)
		instantiate_shooter1(Vector2(1880, 350), Vector2.UP, 3, 80, 600, 0, 0)
	elif id == 3:
		instantiate_shooter1(Vector2(1500, 1040), Vector2.RIGHT, 4, 150, 500, 0, 80)
		instantiate_shooter1(Vector2(1820, 100), Vector2(-1,-1), 5, 100, 450, 1000, 1000)
		instantiate_shooter1(Vector2(100, 980), Vector2(0.2,0.8), 5, 100, 500, 1000, 1000)
		instantiate_shooter2(Vector2(40, 40), Vector2(0,1), 300, 540, 1000, 1000)
		instantiate_shooter2(Vector2(1880, 1040), Vector2(0,-1), 160, 600, 0, 1)
	
	pass

func instantiate_shooter1(pos : Vector2, dir : Vector2, frq : int, amp : int, s_spd : int, t1 : float, t2 : float):
	var instance = s1_scene.instantiate();
	instance.position = pos;
	instance.Frequency = frq;
	instance.Amplitude = amp;
	instance.Shoot_spd = s_spd;
	instance.Dir = dir;
	instance.stop_shoot = t1;
	instance.return_shoot = t2;
	add_child(instance)
	
	pass

func instantiate_shooter2(pos : Vector2, dir : Vector2, spd : int, s_spd : int, t1 : float, t2 : float):
	var instance = s2_scene.instantiate();
	instance.position = pos;
	instance.Spd = spd;
	instance.Shoot_spd = s_spd;
	instance.Dir = dir;
	instance.stop_shoot = t1;
	instance.return_shoot = t2;
	add_child(instance)
	
	pass
