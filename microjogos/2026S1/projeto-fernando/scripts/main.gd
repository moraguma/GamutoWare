extends Node2D
var aleatorio = randi()%3
var lista = ["Atacar", "Defender", "Conversar", "Item"]
var i = 0
var blade = 0
var levantar = 0
var sal_available = 0
var click = 0
var block = 0
var princess_fly = 0
var loss = 0

func delet():
	$Espada.visible = false
	$Botoes.visible = false
# Called when the node enters the scene tree for the first time.

func _ready():
	$Saleiro.visible = false
	$Sal.visible = false
	if aleatorio == 0:
		$Abobora.queue_free()
	else:
		$Abobora.play("default")
	if aleatorio == 1:
		$Fantasma.queue_free()
	else:
		$Fantasma.play("default")
	if aleatorio == 2:
		$Abobora.queue_free()
		$Fantasma.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Input.is_action_just_pressed("esquerda"):
		if i != 0:
			if block == 0:
				i-=1
	if Input.is_action_just_pressed("direita"):
		if i!=3:
			i+=1
	if Input.is_action_just_pressed("acao")  and loss != 1:
		if i == 1:
			if aleatorio == 0:
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" Sai de trás desse escudo!")
					princess_fly = 1
			if aleatorio == 1 and loss !=1:
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" Sério?? E EU??? >:(")
					princess_fly = 1
			if aleatorio == 2 and loss !=1:
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" ...Tá com medo de mim? Eu não mordo")
		if i == 2:
			if aleatorio == 0 and loss !=1:
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" Isso não é undertale!")
					princess_fly = 1
			if aleatorio == 1 and loss !=1:
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" Você tem uma espada cara! >:(")
					princess_fly = 1
			if aleatorio == 2 and loss != 1:
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" Veio me salvar? Meu herói!")
					Minigames.register_win(self)
				
		
		if i == 0:
			if aleatorio == 1 and loss !=1:
				blade = 1
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" Que corajoso! Meu herói! <3")
					Minigames.register_win(self)
			if aleatorio == 0 and loss !=1:
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" Cortar um fantasma? É sério?")
				princess_fly = 1
			if aleatorio == 2 and loss !=1:
				if $Princesa.animation != "parada":
					$Princesa.play("parada")
					$Dialogo/Timer.start()
					mostrar_texto(" Cortou meu cabelo, seu monstro!")
					
	if Input.is_action_just_pressed("acao"):
		click +=1
		if i == 3:
			delet()
			$Saleiro.visible = true
			$Sal.visible = true
			$Sal.modulate = Color(1,0,0)
			block = 1
			if click == 2:
				if aleatorio == 1 and loss !=1:
					if $Princesa.animation != "parada":
						$Princesa.play("parada")
						$Dialogo/Timer.start()
						mostrar_texto("  Sal!? Você quer comer a abóbora?")
						princess_fly = 1
					
				if aleatorio == 0 and loss != 1:
					if $Princesa.animation != "parada":
						$Princesa.play("parada")
						$Dialogo/Timer.start()
						mostrar_texto(" Que esperto! Meu herói! <3")
						$Fantasma.fantasma_giro = 1
						Minigames.register_win(self)
					
				if aleatorio == 2 and loss !=1:
					if $Princesa.animation != "parada":
						$Princesa.play("parada")
						$Dialogo/Timer.start()
						mostrar_texto(" Sal?! Eu sou hipertensa seu monstro")

func mostrar_texto(text):
	$Dialogo.text = text
	$Dialogo.visible_characters = 0
	$Dialogo/Timer.start()

	
func _on_timer_timeout() -> void:
	$Dialogo.visible_characters +=1


func _on_area_2d_area_entered(area: Area2D):
	$Princesa.voasim = 1
	loss = 1
	
	
