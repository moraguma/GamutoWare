extends CharacterBody2D


const SPEED = 700.0
const JUMP_VELOCITY = -1000
@onready var base = get_parent()
@onready var som_pulo = get_node("Pulo")
@onready var som_morte = get_node("Morte")
var jogo_acabou = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not jogo_acabou:	
		if not is_on_floor():
			velocity.y += gravity * delta * 2.5

		# Handle Jump.
		if (Input.is_action_just_pressed("acao") or Input.is_action_just_pressed("cima")) and is_on_floor():
			velocity.y = JUMP_VELOCITY
			som_pulo.play()

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("esquerda", "direita")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()

func _on_win_body_entered(body):
	var player = $"../Player"
	if body == player:
		base.emit_signal("win")
		print("Voce ganhou!")
		jogo_acabou = true
		som_morte.play()

func _on_espinhos_body_entered(body):
	var player = $"../Player"
	if body == player:
		base.emit_signal("lose")
		print("Voce perdeu!")
		jogo_acabou = true
		som_morte.play()
