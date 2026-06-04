extends Area2D

var tile_size = 16
var dir_atual 
var pos = [1792,952]
var pos_trilha = [pos[0], pos[1]]
var morreu = false
@onready var trilha = preload("res://microjogos/2026S1/projeto-yuji/cenas/trilha.tscn")
@onready var anim = $Sprite2D/AnimationPlayer
@onready var animated_sprite_2D = $"explosão"
@onready var sfx_player = $Explosao
func _ready():
	dir_atual = "esquerda"
	$Sprite2D/AnimationPlayer.play("inimigo")
	self.position = Vector2(pos[0], pos[1])
	
func _physics_process(delta: float) -> void:
	if morreu:
		return
	monitoring = true
	var trilha_novo
	if dir_atual == "direita":
		pos[0] +=tile_size
		if pos[0] >1920:
			pos[0] -=1920
			pos_trilha[0] -=1920
		pos_trilha[0] += tile_size
	elif dir_atual == "esquerda":
		pos[0] -=tile_size
		if pos[0]<0:
			pos[0] +=1920
			pos_trilha[0] +=1920
		pos_trilha[0] -= tile_size
	elif dir_atual == "cima":
		pos[1] -=tile_size
		if pos[1]<0:
			pos[1] +=1080
			pos_trilha[1] +=1080
		pos_trilha[1] -= tile_size
	elif dir_atual == "baixo":
		pos[1] +=tile_size
		if pos[1]>1080:
			pos[1] -=1080
			pos_trilha[1] -=1080
		pos_trilha[1] += tile_size
	if Input.is_action_just_pressed("direita") and dir_atual != "baixo":
		dir_atual = "cima"
		set_rotation_degrees(0)
	elif Input.is_action_just_pressed("esquerda") and dir_atual != "cima":
		dir_atual = "baixo"
	elif Input.is_action_just_pressed("cima") and dir_atual != "direita":
		dir_atual = "esquerda"
	elif Input.is_action_just_pressed("baixo") and dir_atual != "esquerda":
		dir_atual = "direita"

	self.position = Vector2(pos[0], pos[1])
	
	trilha_novo = trilha.instantiate()
	trilha_novo.modulate = Color(255,0,0)
	trilha_novo.position = Vector2(pos_trilha[0], pos_trilha[1])
	get_parent().add_child(trilha_novo)
	var lista = get_overlapping_bodies()
	if lista != [] and not morreu:
		morreu = true
		$Sprite2D.visible = false
		$"explosão".visible = true
		animated_sprite_2D.play("default")
		sfx_player.play()
		return
