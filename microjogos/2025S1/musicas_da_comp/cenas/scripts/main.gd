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

const perguntas_Corpo_Nu = ["Sua mãe ... querendo me matar. Pode deixar minha sogra eu penso em me casar", "Me chamam de ... não quero nem saber, eu sei que estou ... por você", "Alô galera, eu ... agora sou um rapaz sério, muito sério", "Você é minha paixão, assinado: ..."]
const perguntas_Renata = ["Por ela fui fiel, tão cego eu fiquei ... amigos eu deixei", "Renata ingrata, trocou meu amor por ...", "A lua entristeceu, o céu mudou de cor, Renata foi embora e ...", "Foi irracional ... mas vou deletar, ah, ah, sua insentatez"]
const perguntas_Ragatanga = []
const perguntas_Madagascar = ["Ela é tão tudo! Ela é tão tudo! Tudo que eu queria ...", "Cabelo colorido, de tomara que caia, meia preta arrastão pra combinar com ...", "Melhor exposição que tenho ... toda delicadinha usando óculos grande", "Vem comigo, amor, eu vou levar pra passear de mãos dadas na areia ..."]

#Dicionários para salvar as perguntas de cada música
const corpo_Nu = {perguntas_Corpo_Nu[0]: ["Bolada", "Com raiva", "Emburrada", "Preocupada"], perguntas_Corpo_Nu[1]: ["Maluco... louco, louco", "Louco... maluco, maluco", "Maluco... maluco, louco", "Louco... louco, maluco"], perguntas_Corpo_Nu[2]: ["Parei de zoar", "Cansei de zuar", "Mandei pra lá", "Achei ela"], perguntas_Corpo_Nu[3]: ["Fleury 02", "Vinicius e Andinho", "Piauí", "DJ Marlboro"]}
const renata = {perguntas_Renata[0]: ["E no night futebol", "Idas para o futebol", "E nas night, futebol", "Indo para o futebol"], perguntas_Renata[1]: ["Uma ilusão", "Um pedaço de pão", "Um garanhão", "Uma sensação"], perguntas_Renata[2]: ["A deprê ficou", "A tevê levou", "Junto o meu amor", "Fez um favor"], perguntas_Renata[3]: ["O que ela fez", "O que você fez", "Como toda vez", "Mais uma vez"]}
const ragatanga = {}
const madagascar = {perguntas_Madagascar[0]: ["Abraçar, beijar", "Era abraçar beijar", "Era poder beijar", "Amassar, beijar"], perguntas_Madagascar[1]: ["Uma saia", "A saia", "O Saia", "A sala"], perguntas_Madagascar[2]: ["No meu stand", "Na minha estante", "Naquele instante", "No mesmo instante"], perguntas_Madagascar[3]: ["De madagascar", "Da beira mar", "Do lado de lá", "No nosso lar"]}

const perguntas = {
	"corpo_Nu":
		{
			
		},
	"renata":
		{
			
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
			
		}
	
}

var musicas = ["corpo_Nu", "renata", "ragatanga", "madagascar"]
var selection_X = 0
var selection_Y = 0
var active = true
var up_left = ""
var up_right = ""
var down_left = ""
var down_right = ""
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
	#var musica = perguntas.values()[randi() % 4]
	var musica = musicas[randi() % 4]
	var num_pergunta = musica.keys()[randi() % 4]
	var num_resposta =	musica[num_pergunta][randi() % 4]
	#var suffled_respostas = musica[pergunta].duplicate()
	#suffled_respostas.shuffle()
	#up_left = shuffled_resposta[0]
	# for i in range(4):
	# lista[i].text = shuffled_respostas[i]
	match musica:
		"corpo_Nu": 
			up_left = corpo_Nu[perguntas_Corpo_Nu[num_pergunta]][num_resposta]
			up_right = musica[perguntas_Corpo_Nu[(num_pergunta + 1) % 4]][(num_resposta + 1) % 4]
			down_left = musica[perguntas_Corpo_Nu[(num_pergunta + 2) % 4]][(num_resposta + 2) % 4]
			down_right = musica[perguntas_Corpo_Nu[(num_pergunta + 3) % 4]][(num_resposta + 3) % 4]
		"renata":
			up_left = corpo_Nu[perguntas_Renata[num_pergunta]][num_resposta]
			up_right = musica[perguntas_Renata[(num_pergunta + 1) % 4]][(num_resposta + 1) % 4]
			down_left = musica[perguntas_Renata[(num_pergunta + 2) % 4]][(num_resposta + 2) % 4]
			down_right = musica[perguntas_Renata[(num_pergunta + 3) % 4]][(num_resposta + 3) % 4]
		"ragatanga":	
			up_left = corpo_Nu[perguntas_Ragatanga[num_pergunta]][num_resposta]
			up_right = musica[perguntas_Ragatanga[(num_pergunta + 1) % 4]][(num_resposta + 1) % 4]
			down_left = musica[perguntas_Ragatanga[(num_pergunta + 2) % 4]][(num_resposta + 2) % 4]
			down_right = musica[perguntas_Ragatanga[(num_pergunta + 3) % 4]][(num_resposta + 3) % 4]
		"madagascar":
			up_left = corpo_Nu[perguntas_Madagascar[num_pergunta]][num_resposta]
			up_right = musica[perguntas_Madagascar[(num_pergunta + 1) % 4]][(num_resposta + 1) % 4]
			down_left = musica[perguntas_Madagascar[(num_pergunta + 2) % 4]][(num_resposta + 2) % 4]
			down_right = musica[perguntas_Madagascar[(num_pergunta + 3) % 4]][(num_resposta + 3) % 4]
			
	
	%Resposta1.text = up_left
	%Resposta2.text = up_right
	%Resposta3.text = down_left
	%Resposta4.text = down_right
	

# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
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
