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
			"Você é minha paixão, assinado: ...": ["Fleury 02", "Vinicius e Andinho", "Piauí", "DJ Marlboro"]
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
			"Não é por acaso que encontro todo dia ... caminhando": ["Cuando me voy", "Quando eu vou", "Quanto eu tô", "Enquando eu vou"],
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
			"Na sala ou no ... no ... ou no ...": ["Quarto... beco... carro", "Beco... carro... quarto", "Quarto... prédio... mato", "Mato... prédio... quarto"]
		}
	
}

var musicas = ["corpo_Nu", "renata", "ragatanga", "madagascar", "shake_it_bololo"]
var selection_X = 0
var selection_Y = 0
var active = true
@export var lista: Array[Label]

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("DO SOMETHING!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FAÇA ALGO!")
	
	randomize()
	var musica_Escolhida = perguntas[musicas[randi() % musicas.size()]] #Escolhe uma das músicas aleatoriamente
	var num_pergunta = musica_Escolhida.keys()[randi() % musica_Escolhida.size()]
	var respostas =	musica_Escolhida[num_pergunta] #Obtém as respostas dessa pergunta
	var shuffled_respostas = respostas.duplicate() #Cria uma cópia das respostas
	shuffled_respostas.shuffle()
	
	for i in range(musicas.size()):
		lista[i].text = shuffled_respostas[i]
	
func _process(delta):
	if active:
		if Input.is_action_just_pressed("cima"):
			selection_Y -= 1
			selection_Y %= 2
		elif Input.is_action_just_pressed("baixo"):
			selection_Y += 1
			selection_Y %= 2
		elif Input.is_action_just_pressed("direita"):
			selection_X += 1
			selection_X %= 2
		elif Input.is_action_just_pressed("esquerda"):
			selection_X -= 1
			selection_X %= 2
			
		elif Input.is_action_just_pressed("acao"): #Aqui é o ponto de seleção da resposta
			active = false

# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass


# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------
# Quando o jogo começa, ela assume que o jogador não conseguiu vencer o jogo ainda, ou seja, se não
# acontecer nada, o jogador vai perder o jogo. A verificação se o jogador venceu o minigame é feita
# com base na emissão dos sinais "win" e "lose". Se "win" foi o último sinal emitido, o jogador
# vencerá o jogo, e se "lose" foi o último sinal emitido ou nenhum sinal foi emitido, o jogador
# perderá o jogo


# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")
