extends Node2D

@export var current_pos = 0
var pode_checkar = true
var perdeu = false
var ganhou = false

var tag

# Called when the node enters the scene tree for the first time.
func _ready():
	current_pos = 0
	tag = $"tag"
	print(tag)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_pos == 1:
		tag.region_rect.size.x = 180
	elif current_pos == 2:
		tag.region_rect.size.x = 340
	elif current_pos == 3:
		tag.region_rect.size.x = 460
	elif current_pos == 4:
		tag.region_rect.size.x = 570
	pass


func _on_timer_timeout():
	pode_checkar = true
	pass # Replace with function body.
