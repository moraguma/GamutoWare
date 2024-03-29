extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@export var speed = 100

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#$"Path2D/PathFollow2D/AnimatedSprite2DLari".play("")
var  audioPlayed = false
func playAudio():
	$"Path2D/PathFollow2D/AnimatedSprite2DLari".play("idle")
	var cafe = $"../cafe/AnimatedSprite2D"
	if $"AudioStreamPlayer".is_playing() == false and !audioPlayed and cafe:
		if cafe.get_animation() != "gone":
			$"AudioStreamPlayer".play()	
			audioPlayed = true
			cafe.play("gone")
			$"../Player/AnimatedSprite2D".play("hurt")
			$"../Label".text = "GAME OVER!"
			$"../".register_lose()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	var path = path_follow.progress
	var lari = $"Path2D/PathFollow2D/AnimatedSprite2DLari";
	if path >= 275 and path <= 400 :
		lari.flip_h = true
	if path >= 415:
		lari.flip_h = false
	if path_follow.progress >= 725:
		playAudio()
		#queue_free()
