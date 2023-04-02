extends Node2D 
# Called when the node enters the scene tree for the first time.
var r = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var i = 0
var sel
var lis_tec =[]
var lis = []
func _ready():
	randomize()
	sel = get_node("Teclas/Seletor")
	var a = randi_range(0,r.size()-1)
	a = r[a]
	r.erase(a)
	var T1 = get_node(a)
	var b = randi_range(0,r.size()-1)
	b = r[b]
	r.erase(b)
	var T2 = get_node(b)
	var c = randi_range(0,r.size()-1)
	c = r[c]
	r.erase(c)
	var T3 = get_node(c)
	var d = randi_range(0,r.size()-1)
	d = r[d]
	r.erase(d)
	var T4 = get_node(d)
	T1.visible = true
	get_node("Teclas/A/RichTextLabel").text = a
	T2.visible = true
	get_node("Teclas/A2/RichTextLabel").text = b
	T3.visible = true
	get_node("Teclas/A3/RichTextLabel").text = c
	T4.visible = true
	get_node("Teclas/A4/RichTextLabel").text = d
	lis = [T1,T2,T3,T4]
	
func _mudar():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("direita")):
		var g = i+1
		i = (g%4)
		sel.transform.position = lis[i].transform.position
	if(Input.is_action_just_pressed("esquerda")):
		print("DDDDD")
	if(Input.is_action_just_pressed("acao")):
		_mudar()
		
