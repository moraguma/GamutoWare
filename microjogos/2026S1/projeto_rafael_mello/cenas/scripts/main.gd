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
		instantiate_shooter1(Vector2(1880, 540), Vector2.UP, 4, 120, 600, 0, 60)
		instantiate_shooter1(Vector2(40, 360), Vector2.DOWN, 2, 50, 1000, 0, 0)
		instantiate_shooter1(Vector2(40, 720), Vector2.DOWN, 2, 50,1000, 0, 0)
	elif id == 2:
		instantiate_shooter1(Vector2(812, 40), Vector2.LEFT, 3, 100, 600, 0, 0)
		instantiate_shooter1(Vector2(1108, 40), Vector2.LEFT, 3, 100, 600, 0, 0)
		instantiate_shooter1(Vector2(40, 730), Vector2.DOWN, 3, 80, 600, 0, 0)
		instantiate_shooter1(Vector2(1880, 350), Vector2.UP, 3, 80, 600, 0, 0)
	elif id == 3:
		instantiate_shooter1(Vector2(1500, 1040), Vector2.RIGHT, 4, 250, 500, 0, 80)
		instantiate_shooter1(Vector2(1820, 100), Vector2(-1,-1), 2, 150, 600, 0, 110)
		instantiate_shooter1(Vector2(100, 980), Vector2(0.2,0.8), 2, 150, 700, 0, 110)
		instantiate_shooter1(Vector2(680, 40), Vector2.LEFT, 4, 250, 500, 0, 80)
		instantiate_shooter1(Vector2(100, 100), Vector2(-1, 1.2), 3, 150, 600, 0, 80)
		instantiate_shooter1(Vector2(1820, 1000), Vector2(1, -0.8), 4, 150, 700, 0, 80)
		
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
