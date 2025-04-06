extends Control

# Declaração dos sinais win e lose

signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

#Dicionário para relacionar a música com suas perguntas e respectivas respostas
const perguntas = {
	"corpo_Nu":
		{
			"Sua mãe ... querendo me matar. Pode deixar minha sogra eu penso em me casar": ["Bolada", "Com raiva", "Emburrada", "Preocupada"],
			"Me chamam de ... não quero nem saber, eu sei que estou ... por você": ["Maluco... louco, louco", "Louco... maluco, maluco", "Maluco... maluco, louco", "Louco... louco, maluco"],
			"Alô galera, eu ... agora sou um rapaz sério, muito sério": ["Parei de zoar", "Cansei de zuar", "Mandei pra lá", "Achei ela"],
			"Você é minha paixão, chora não, porquê eu te amo. Assinado simplesmente: ...": ["Fleury 02", "Vinicius e Andinho", "Piauí", "DJ Marlboro"]
		},
	"renata":
		{
			"Por ela fui fiel, tão cego eu fiquei ... amigos eu deixei": ["E no night futebol", "Idas para o futebol", "E nas night, futebol", "Indo para o futebol"],
			"Renata ingrata, trocou meu amor por ...": ["Uma ilusão", "Um pedaço de pão", "Um garanhão", "Uma sensação"],
			"A lua entristeceu, o céu mudou de cor, Renata foi embora e ...": ["A deprê ficou", "A tevê levou", "Junto o meu amor", "Fez um favor"],
			"Foi irracional ... mas vou deletar, ah, ah, sua insentatez": ["O que ela fez", "O que você fez", "Como toda vez", "Mais uma vez"]
		},
	"ragatanga" : 
		{
			"E o DJ que já conhece ... pra Diego, a canção mais desejada" : ["Toca o som da meia-noite", "Vai tocando toda a noite", "Vai dançando lá no front", "Dedica à meia-noite"],
			"Aserehe ra de re De hebe tu de hebere seibiunouba mahabi ...": ["An de bugui an de buididipi", "To the rhythm of the boogi, the beat", "Andebuggy Andebuggy Riby", "And the boogie and the boogie, the beat"],
			"Não é por acaso que encontro todo dia (todo dia) ... caminhando": ["Cúando me voy", "Quando eu vou", "Quanto eu tô", "Enquanto eu vou"],
			"Olha lá quem vem virando a esquina vem ... com toda a alegria, festejando": ["Diego", "Fernando", "Hermano", "Miguel"]
		},
	"madagascar":
		{
			"Ela é tão tudo! Ela é tão tudo! Tudo que eu queria ...": ["Abraçar, beijar", "Era abraçar beijar", "Era poder beijar", "Amassar, beijar"],
			"Cabelo colorido, de tomara que caia, meia preta arrastão pra combinar com ...": ["Uma saia", "A saia", "O Saia", "A sala"],
			"Melhor exposição que tenho ... toda delicadinha usando óculos grande": ["No meu stand", "Na minha estante", "Naquele instante", "No mesmo instante"],
			"Vem comigo, amor, eu vou levar pra passear de mãos dadas na areia ...": ["De madagascar", "Da beira mar", "Do lado de lá", "No nosso lar"]
		},
	"shake_it_bololo":
		{
			"Cabelo da ... pra mostrar que é de vilão": ["Tony Country", "Tony Hawk", "Calvin Klein", "Gang mark"],
			"Na sala ou no ... no ... ou no ...": ["Quarto... beco... carro", "Beco... carro... quarto", "Quarto... prédio... mato", "Mato... prédio... quarto"],
			"Dei um fim na relação, você não acreditou por ... o amor acabou": ["Causa de traição", "Uma decepção", "Negação", "Causa do 100nossão"],
			"E a cada acelerada é um tipo de risada ...": ["Vrau-vrau-vrau, ho-ho-ho, ha-ha-ha, bololo", "Ha-ha-ha, ho-ho-ho, vrau-vrau-vrau, bololo", "Vrau-vrau-vrau, bololo, ha-ha-ha, ho-ho-ho", "Ha-ha-ha, bololo, vrau-vrau-vrau, ho-ho-ho"]
		},
	"a": 
		{
			"AAAAAAAAAAAAAAAAAAAAA...": ["AAAAAAAAAAAAAAA", "arrrrrrrr", "Tanto querer", "*respira*"]
		}
}

var musicas = ["corpo_Nu", "renata", "ragatanga", "madagascar", "shake_it_bololo", "a"]
var respostas= []
var shuffled_respostas = []
var selection_X = 0
var selection_Y = 0
var active = true
var pergunta_escolhida
var musica_Escolhida
@onready var corpoNu = $Musica1
@onready var renata = $Musica2
@onready var ragatanga = $Musica3
@onready var madagascar = $Musica4
@onready var shakeItBololo = $Musica5
@onready var question = %Pergunta
@onready var lista: Array = $PanelContainer/MarginContainer/GridContainer.get_children()

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	var p1 = $PanelContainer/MarginContainer/GridContainer/Pergunta1
	var p2 = $PanelContainer/MarginContainer/GridContainer/Pergunta2
	var p3 = $PanelContainer/MarginContainer/GridContainer/Pergunta3
	var p4 = $PanelContainer/MarginContainer/GridContainer/Pergunta4
	
	p1.pressed.connect(pergunta_pressed.bind(p1))
	p2.pressed.connect(pergunta_pressed.bind(p2))
	p3.pressed.connect(pergunta_pressed.bind(p3))
	p4.pressed.connect(pergunta_pressed.bind(p4))
	
	$PanelContainer/MarginContainer/GridContainer/Pergunta1.grab_focus()

	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("COMPLETE THE COMP SONG!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("COMPLETE A MÚSICA DA COMP!")
	
	randomize()
	musica_Escolhida = perguntas[musicas[randi() % musicas.size()]] #Escolhe uma das músicas aleatoriamente
	pergunta_escolhida = musica_Escolhida.keys()[randi() % musica_Escolhida.size()]
	respostas =	musica_Escolhida[pergunta_escolhida] #Obtém uma lista das respostas dessa pergunta ordenada corretamente
	shuffled_respostas = respostas.duplicate() #Cria uma cópia das respostas para poder embaralhar
	shuffled_respostas.shuffle()
	question.add_text(pergunta_escolhida)
	
	for i in range(4):
		lista[i].text = shuffled_respostas[i]
	
	#Toca a música de acordo com qual delas foi escolhida aleatoriamente
	if musica_Escolhida == perguntas[musicas[0]]:
		corpoNu.play()
	elif musica_Escolhida == perguntas[musicas[1]]:
		renata.play()
	elif musica_Escolhida == perguntas[musicas[2]]:
		ragatanga.play()
	elif musica_Escolhida == perguntas[musicas[3]]:
		madagascar.play()
	elif musica_Escolhida == perguntas[musicas[4]]:
		shakeItBololo.play()
		
func _process(delta):

	pass

func pergunta_pressed(pergunta) -> void:
	$PanelContainer.queue_free()
	if(musica_Escolhida.get(pergunta_escolhida)[0] == pergunta.text):
		$VDC_Feliz.visible = true
	else:
		$VDC_Tristes.visible = true
