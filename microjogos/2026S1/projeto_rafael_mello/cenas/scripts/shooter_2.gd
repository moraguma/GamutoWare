extends CharacterBody2D

var inter_time = 0;

@export var stop_shoot = 1000.0;
@export var return_shoot = 1000.0;
@export var Shoot_spd = 600;
@export var Spd = 200;
@export var Dir = Vector2.UP;

var scene = preload("res://microjogos/2026S1/projeto_rafael_mello/cenas/Tiro1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.rotation = Dir.angle()
	position = position + Dir.normalized()*Spd*delta
	inter_time += delta
	pass


func _on_timer_timeout() -> void:
	if inter_time < stop_shoot or inter_time > return_shoot:
		var instance = scene.instantiate();
		instance.speed = Dir.normalized().rotated(-PI/2)*Shoot_spd;
		instance.position = position;
		
		get_node("../Tiros").add_child(instance);
	pass # Replace with function body.
