extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
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
var spacePress = 0 
var pressDone = RandomNumberGenerator.new().randi_range(15,20)

func _input(event):  
	if Input.is_action_just_pressed("acao") and spacePress<pressDone:
		$Timer.start()
		self.emitting = true
		spacePress += 1
		print(spacePress)
	if spacePress >= pressDone:      
		get_owner().register_win()
		print("its winning time")
		
 

func _on_timer_timeout():
	self.emitting = false









