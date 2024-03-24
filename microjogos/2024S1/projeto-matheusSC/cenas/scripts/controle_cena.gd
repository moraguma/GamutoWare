extends Node2D

var current_pos = 0
var pode_checkar = true
var perdeu = false
var ganhou = false
var current_pressed = ""

var particulas
var crowd_anim
var oh_no
var gota

var crowd_anim_played = false


# Called when the node enters the scene tree for the first time.
func _ready():
	current_pos = 0
	particulas = $"particulas"
	crowd_anim = $"crowd/AnimationPlayer"
	oh_no = $"oh no"
	gota = $"gota"
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ganhou:
		particulas.emitting = true
		if not crowd_anim_played:
			crowd_anim.play("crowd_shake")
			crowd_anim_played = true
			emit_signal("win")
	if perdeu:
		oh_no.play()
		oh_no.visible = true
		gota.visible = true
	pass


func _on_timer_timeout():
	pode_checkar = true
	pass # Replace with function body.
