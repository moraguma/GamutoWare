extends CharacterBody2D

var inter_time = 0;
var Initial_Pos : Vector2;

@export var stop_shoot = 1000.0;
@export var return_shoot = 1000.0;
@export var Shoot_spd = 600;
@export var Frequency = 1;
@export var Amplitude = 100;
@export var Dir = Vector2.UP;

var scene = preload("res://microjogos/2026S1/projeto_rafael_mello/cenas/Tiro1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Initial_Pos = position
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.rotation = Dir.angle()
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	position = Initial_Pos + Dir.normalized()*sin(Frequency*inter_time)*Amplitude
	inter_time += delta
	pass


func _on_timer_timeout() -> void:
	var Dist = position.distance_to(Initial_Pos)
	if Dist < stop_shoot or Dist > return_shoot:
		var instance = scene.instantiate();
		instance.speed = Dir.normalized().rotated(-PI/2)*Shoot_spd;
		instance.position = position + instance.speed/Shoot_spd*48;
		get_node("../Tiros").add_child(instance);
	pass
