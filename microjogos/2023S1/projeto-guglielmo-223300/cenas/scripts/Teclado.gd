extends Node2D
var r = ["Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","X","C","V","B","Y","Z"]
var i = 0
var j = 0
var d1
var d2
var d3
var d4
var A
var a
var B
var b
var C
var c
var D
var d
@onready var sel_tec1
@onready var sel_tec2
@onready var sel_tec3
@onready var sel_tec4
@onready var lis = []
@onready var lis1 = []
@onready var lis_sel = []

@onready var key_sounds = [$"../Key1", $"../Key2"]
@onready var win_sound = $"../Win"
@onready var lose_sound = $"../Lose"

var missed = false
func _ready():
	$"../AudioStreamPlayer2D".play()
	
	randomize()
	sel_tec1 = get_node("Seletor teclado1")
	sel_tec2 = get_node("Seletor teclado2")
	sel_tec3 = get_node("Seletor teclado3")
	sel_tec4 = get_node("Seletor teclado4")
	lis_sel = [sel_tec1,sel_tec2,sel_tec3,sel_tec4]
	while(a==b or a==c or a==d or b==c or b==d or c==d):
		randomize()
		a = randi_range(0,len(r))
		A = r[a]
		b = randi_range(0,r.size()-1)
		B = r[b]
		c = randi_range(0,r.size()-1)
		C = r[c]
		d = randi_range(0,r.size()-1)
		D = r[d]
	var fil = [A,B,C,D]
	fil.sort()
	var T1 = get_node(fil[0])
	var T2 = get_node(fil[1])
	var T3 = get_node(fil[2])
	var T4 = get_node(fil[3])
	T1.visible = true
	get_node("Teclas/A/RichTextLabel").text = fil[0]
	T2.visible = true
	get_node("Teclas/A2/RichTextLabel").text = fil[1]
	T3.visible = true
	get_node("Teclas/A3/RichTextLabel").text = fil[2]
	T4.visible = true
	get_node("Teclas/A4/RichTextLabel").text = fil[3]
	d1 = T1.position
	d2 = T2.position
	d3 = T3.position
	d4 = T4.position
	var rnd = randi_range(0,3)
	lis = [d1,d2,d3,d4]
	lis1 = lis
	sel_tec1.position = lis[rnd]
	i = rnd
	
func _mudar():
	key_sounds[randi() % len(key_sounds)].play()
	
	if(i!=0):
		missed = true
	lis.pop_at(i)
	j+=1
	if(j < 4):
		var rnd = randi_range(0,lis.size()-1)
		lis_sel[j].visible = true
		lis_sel[j].position = lis[rnd]
		i = rnd
	else:
		if not missed:
			get_parent().register_win()
			win_sound.play()
		else:
			lose_sound.play()

func _process(delta):
	if(Input.is_action_just_pressed("direita") and lis.size() != 0):
		var g = i+1
		i = (g%lis.size())
		lis_sel[j].position = lis[i]
	if(Input.is_action_just_pressed("esquerda") and lis.size() != 0):
		var g = i-1
		i = (g%lis.size())
		lis_sel[j].position = lis[i]
	if(Input.is_action_just_pressed("acao")):
		_mudar()
