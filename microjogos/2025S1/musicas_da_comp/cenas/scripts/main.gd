extends Node2D

# Declaração dos sinais win e lose

signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

const perguntas_Corpo_Nu = ["Sua mãe ... querendo me matar. Pode deixar minha sogra eu penso em me casar", "Me chamam de ... não quero nem saber, eu sei que estou ... por você", "Alô galera, eu ... agora sou um rapaz sério, muito sério", "Você é minha paixão, chora não, porquê eu te amo Assinado simplesmente: ..."]
const perguntas_Renata = ["Por ela fui fiel, tão cego eu fiquei ... amigos eu deixei", "Renata ingrata, trocou meu amor por ...", "A lua entristeceu, o céu mudou de cor, Renata foi embora e ...", "Foi irracional ... mas vou deletar, ah, ah, sua insentatez"]
const perguntas_Ragatanga = ["E o DJ que já conhece ... pra Diego, a canção mais desejada", "Aserehe ra de re De hebe tu de hebere seibiunouba mahabi ...", "Não é por acaso que encontro todo dia ... caminhando", "Olha lá quem vem virando a esquina vem ... com toda a alegria, festejando"]
const perguntas_Madagascar = ["Ela é tão tudo! Ela é tão tudo! Tudo que eu queria ...", "Cabelo colorido, de tomara que caia, meia preta arrastão pra combinar com ...", "Melhor exposição que tenho ... toda delicadinha usando óculos grande", "Vem comigo, amor, eu vou levar pra passear de mãos dadas na areia ..."]

#Dicionários para salvar as perguntas de cada música
const corpo_Nu = {perguntas_Corpo_Nu[0]: ["Bolada", "Com raiva", "Emburrada", "Preocupada"], perguntas_Corpo_Nu[1]: ["Maluco... louco, louco", "Louco... maluco, maluco", "Maluco... maluco, louco", "Louco... louco, maluco"], perguntas_Corpo_Nu[2]: ["Parei de zoar", "Cansei de zuar", "Mandei pra lá", "Achei ela"], perguntas_Corpo_Nu[3]: ["Fleury 02", "Vinicius e Andinho", "Piauí", "DJ Marlboro"]}
const renata = {perguntas_Renata[0]: ["E no night futebol", "Idas para o futebol", "E nas night, futebol", "Indo para o futebol"], perguntas_Renata[1]: ["Uma ilusão", "Um pedaço de pão", "Um garanhão", "Uma sensação"], perguntas_Renata[2]: ["A deprê ficou", "A tevê levou", "Junto o meu amor", "Fez um favor"], perguntas_Renata[3]: ["O que ela fez", "O que você fez", "Como toda vez", "Mais uma vez"]}
const ragatanga = {perguntas_Ragatanga[0]: ["Toca o som da meia-noite", "Vai tocando toda a noite", "Vai dançando lá no front", "Dedica à meia-noite"], perguntas_Ragatanga[1]: ["An de bugui an de buididipi", "To the rhythm of the boogi, the beat", "Andebuggy Andebuggy Riby", "And the boogie and the boogie, the beat"], perguntas_Ragatanga[2]: ["Cuando me voy", "Quando eu vou", "Quanto eu tô", "Enquando eu vou"], perguntas_Ragatanga[3]: ["Diego", "Fernando", "Hermano", "Miguel"]}
const madagascar = {perguntas_Madagascar[0]: ["Abraçar, beijar", "Era abraçar beijar", "Era poder beijar", "Amassar, beijar"], perguntas_Madagascar[1]: ["Uma saia", "A saia", "O Saia", "A sala"], perguntas_Madagascar[2]: ["No meu stand", "Na minha estante", "Naquele instante", "No mesmo instante"], perguntas_Madagascar[3]: ["De madagascar", "Da beira mar", "Do lado de lá", "No nosso lar"]}

#Dicionários para buscar as opções de perguntas a partir do nome da música
#const musicas = {"Corpo Nu": }

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("DO SOMETHING!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FAÇA ALGO!")


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	pass


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


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
