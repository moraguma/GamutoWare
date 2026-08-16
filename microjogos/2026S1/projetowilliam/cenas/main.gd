extends Node2D
@export var rigid_body_2d_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Minigames.register_win(self)
	var screen_size = get_viewport_rect().size
	randomize()
	
	while true:
		var box = rigid_body_2d_scene.instantiate()
		#box.position.x = randf_range(0, 14) * screen_size.x / 14
		box.position.x = randf_range(0, screen_size.x)
		var sprite_node = box.get_node("ColorRect")
		sprite_node.texture = load(choice_texture())
		box.position.y = screen_size.y+100
		add_child(box)
		
		await get_tree().create_timer(0.2).timeout

func choice_texture():
	var aleatorio =  randi_range(1, 5) 
	var aleatorio2 = randi_range(1, 2)
	var primeira_parte_caminho
	if aleatorio2 == 1: 
		primeira_parte_caminho = "res://microjogos/2026S1/projetowilliam/recursos/imagens/FreeArt_boxe&amp;crates1/obj_crate00"
	else: 
		primeira_parte_caminho = "res://microjogos/2026S1/projetowilliam/recursos/imagens/FreeArt_boxe&amp;crates1/obj_box00"
	
	var caminho = primeira_parte_caminho+str(aleatorio)+".png"
	print(caminho)
	return caminho

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
