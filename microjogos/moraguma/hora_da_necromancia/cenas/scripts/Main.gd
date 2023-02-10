extends Node2D

signal win
signal lose


const WIDTH = 1920
const HEIGHT = 1080

const LOVE = {Global.LANGUAGE.PT: ["Você fica lindo sob a luz do luar", "Os seus chifres são brilhantes", "Seus olhos me incandescem", "Sua capa é tão sedosa..."], Global.LANGUAGE.EN: ["You look beautiful under the moonlight", "Your antlers look radiant", "I could get lost in your eyes", "Your cape is so soft..."]}
const FAMILY = {Global.LANGUAGE.PT: ["Saudades da sua irmã...", "Aquele teu tio é doido", "E vovó, cadê?", "Me passa o número da sua tia?"], Global.LANGUAGE.EN: ["I miss your sister...", "That uncle of yours is insane", "And grandma? Where is she?", "Can I get your aunt's number?"]}
const RUDE = {Global.LANGUAGE.PT: ["Eae, viu o jogo de ontem?", "*Enfiar o dedo na cavidade ocular dele*", "Fala esqueletão!", "Qual a da vez, ossudo?"], Global.LANGUAGE.EN: ["So, you catch the game last night?", "*Stick your finger in his eye socket*", "Sup, skull man!", "High ho, skelly!"]}


var texts = ["", "", ""]
var right_box = 0
var selection = 0
var active = true


onready var animation_player = $AnimationPlayer
onready var text_boxes = [$T1, $T2, $T3]

onready var win_sound = $WinSound
onready var lose_sound = $LoseSound
onready var choose_sound = $ChooseSound
onready var wow_sound = $WowSound
onready var music = $Music


func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("CONQUISTE!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("CHARM!")
	
	animation_player.play("idle")
	
	randomize()
	
	right_box = randi() % 3
	
	var family_box = randi() % 3
	while family_box == right_box:
		family_box = randi() % 3
	
	var rude_box 
	for i in range(3):
		if i != family_box and i != right_box:
			rude_box = i
			break
	
	texts[right_box] = LOVE[Global.language][randi() % 4]
	texts[family_box] = FAMILY[Global.language][randi() % 4]
	texts[rude_box] = RUDE[Global.language][randi() % 4]
	
	set_texts()
	select(selection)
	
	music.play()


func _physics_process(delta):
	if active:
		if Input.is_action_just_pressed("cima"):
			choose_sound.play()
			set_texts()
			selection -= 1
			if selection < 0:
				selection = 2
			
			select(selection)
		elif Input.is_action_just_pressed("baixo"):
			choose_sound.play()
			set_texts()
			selection += 1
			if selection > 2:
				selection = 0
			
			select(selection)
		elif Input.is_action_just_pressed("acao"):
			active = false
			
			for text in text_boxes:
				text.hide()
			
			if selection == right_box:
				win_sound.play()
				wow_sound.play()
				animation_player.play("love")
				emit_signal("win")
			else:
				lose_sound.play()
				music.stop()
				animation_player.play("hate")


func set_texts():
	for i in range(len(text_boxes)):
		text_boxes[i].bbcode_text = "[center]" + texts[i]


func select(n):
	text_boxes[n].bbcode_text = "[center][color=aqua][wave]" + texts[n]
