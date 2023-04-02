extends Node2D 
# Called when the node enters the scene tree for the first time.
var r = ["Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","Y","Z"]
var i = 0
var j = 0
var d1
var d2
var d3
var d4
var win
@onready var sel_tec1
@onready var sel_tec2
@onready var sel_tec3
@onready var sel_tec4
@onready var lis = []
@onready var lis1 = []
@onready var lis_sel = []
func _ready():
	randomize()
	sel_tec1 = get_node("Seletor teclado1")
	sel_tec2 = get_node("Seletor teclado2")
	sel_tec3 = get_node("Seletor teclado3")
	sel_tec4 = get_node("Seletor teclado4")
	lis_sel = [sel_tec1,sel_tec2,sel_tec3,sel_tec4]
	var a = randi_range(0,r.size()-1)
	var A = r[a]
	r.pop_at(a)
	randomize()
	var b = randi_range(0,r.size()-1)
	var B = r[b]
	r.pop_at(b)
	randomize()
	var c = randi_range(0,r.size()-1)
	var C = r[c]
	r.pop_at(c)
	randomize()
	var d = randi_range(0,r.size()-1)
	var D = r[d]
	r.pop_at(d)
	randomize()
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
	if(i!=0):
		print('Aaaa')
		win = false
	lis.pop_at(i)
	j+=1
	if(j < 4):
		var rnd = randi_range(0,lis.size()-1)
		lis_sel[j].visible = true
		lis_sel[j].position = lis[rnd]
		i = rnd
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("direita")):
		var g = i+1
		i = (g%lis.size())
		lis_sel[j].position = lis[i]
	if(Input.is_action_just_pressed("esquerda")):
		var g = i-1
		i = (g%lis.size())
		lis_sel[j].position = lis[i]
	if(Input.is_action_just_pressed("acao")):
		_mudar()
		
