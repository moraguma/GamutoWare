extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 30;
var vivo = true
var timer
var death_s
var fly_s
var ativar = false
var timer_ativ

func _ready():
	timer_ativ = $Timer2
	timer_ativ.start(1)
	
func _physics_process(delta):
	if vivo:
		$AnimatedSprite2D.play("Fly")
		if ativar:
			velocity.y += gravity;
		if Input.is_action_just_pressed("acao"):
			ativar = true
			fly_s = $Som_asa
			fly_s.play()
			velocity.y = JUMP_VELOCITY*2
		move_and_slide()
	else:
		velocity.x = 0
		velocity.y = 0

func _on_hitbox_body_entered(body):
	Global
	vivo = false
	$AnimatedSprite2D.play("Hit")
	death_s = $SomDeath
	death_s.play()
	timer = $Timer
	get_parent().register_lose()
	timer.start(1)


func _on_timer_timeout():
	death_s.stop()
	$AnimatedSprite2D.visible = false


func _on_timer_2_timeout():
	ativar = true
