extends CharacterBody2D

@onready var speed_multiplier: float = $"..".speed_multiplier

signal sorvete_capturado

const SPEED = 600.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocity.x = 900 * speed_multiplier
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -900 * speed_multiplier
	else:
		velocity.x = 0
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move_and_slide()

func _on_sorvete_contacted(node):
	print("_on_sorvete_contacted(node): node.name + self.name: ", node.name, " + ", name )
	node.velocity.y = 0
	node.freeze = true
	node.reparent(self)
	node.sorvete_contacted.disconnect(_on_sorvete_contacted)
	sorvete_capturado.emit()
	pass # Replace with function body.
