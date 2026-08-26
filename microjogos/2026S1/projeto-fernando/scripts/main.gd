extends Node2D
var aleatorio = randi()%3
var lista = ["Atacar", "Defender", "Conversar", "Item"]
var i = 0
var blade = 0
var click = 0
var block = 0
var loss = false
var win = false

func change():
	$Espada.visible = not $Espada.visible
	$Botoes.visible = not $Botoes.visible
	$Saleiro.visible = not $Saleiro.visible
	$Sal.visible = not $Sal.visible
	$Sal.modulate = Color(1,0,0)
	block = not block

func perdeu():
	loss = true
	block = true
	Minigames.register_lose(self)
	
func venceu():
	win = true
	block = true
	$Princesa.play("levantando")
	Minigames.register_win(self)
func _ready():
	if aleatorio == 0:
		$Abobora.queue_free()
	if aleatorio == 1:
		$Fantasma.queue_free()
	if aleatorio == 2:
		$Abobora.queue_free()
		$Fantasma.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Input.is_action_just_pressed("esquerda") and i != 0 and not block:
		i-=1
		
	if Input.is_action_just_pressed("direita") and i!=3 and  not block:
		i+=1
		
	if Input.is_action_just_pressed("acao")  and not loss and not win:
		if i == 0:
			$Efeito_espada.aparecer = true
			if aleatorio == 1:
				$Dialogo.mostrar_texto(" Que corajoso! Meu herói! <3")
				$Abobora.abobora_giro = true
				venceu()
			elif aleatorio == 0:
				$Dialogo.mostrar_texto(" Cortar um fantasma? É sério?")
			elif aleatorio == 2:
				$Dialogo.mostrar_texto(" Cortou meu cabelo, seu monstro!")
				perdeu()
		elif i == 1:
			if aleatorio == 0:
				$Dialogo.mostrar_texto(" Sai de trás desse escudo!")
			if aleatorio == 1:
				$Dialogo.mostrar_texto(" Sério?? E EU??? >:(")
			if aleatorio == 2:
				$Dialogo.mostrar_texto(" ...Tá com medo de mim? Eu não mordo")
				perdeu()
		elif i == 2:
			if aleatorio == 0:
				$Dialogo.mostrar_texto(" Isso não é undertale!")
			elif aleatorio == 1:
				$Dialogo.mostrar_texto(" Você tem uma espada cara! >:(")
			elif aleatorio == 2:
				$Dialogo.mostrar_texto(" Veio me salvar? Meu herói!")
				venceu()
		elif i == 3:
			click +=1
			change()
			if click == 2:
				if aleatorio == 1:
					$Dialogo.mostrar_texto("  Sal!? Você quer comer a abóbora?")
				elif aleatorio == 0:
					$Dialogo.mostrar_texto(" Que esperto! Meu herói! <3")
					$Fantasma.fantasma_giro = true
					venceu()
				elif aleatorio == 2:
					$Dialogo.mostrar_texto(" Sal?! Eu sou hipertensa seu monstro")
					perdeu()
