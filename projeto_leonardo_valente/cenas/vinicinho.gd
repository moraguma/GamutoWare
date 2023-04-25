extends CharacterBody2D

var morto = false
const SPEED = 500.0

func _ready():
	for i in range(3):
		$"../CreeperSpawner".spawn_creeper()

func _physics_process(delta):
	if(morto):
		return
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	var direction = Vector2(Input.get_axis("esquerda", "direita"),Input.get_axis("cima", "baixo"))
	
	
	velocity = direction.normalized()*SPEED
	
	move_and_slide()

func morrer():
	morto = true
	$Cova.show()
	$Vinicin.hide()
