extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

#Emitting do partículas_pi
#emitting = off
#space_press = número de vezes que o espaço foi pressionado

#Se pressionar espaço:
	#Emitting do particulas_pi fica on
		#por 1 segundo
	#contar space_press + 1
	
#se space_press == 12:
	#venceu o jogo
#esse não deu certo
#@onready var pepperEmission = $particulas_pi.emitting
# vou usar isso https://godotengine.org/qa/97936/how-to-reference-a-variable-or-property-of-a-node

#segunda tentativa
pepperEmission = get_node
pepperEmission = false
var spacePress = 0  
var pressDone = 12

func _input(event):
	if Input.is_action_just_pressed("Space") and spacePress <= pressDone :
		emmiting = true
		spacePress += 1
		
		
		
		
