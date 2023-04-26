extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(tentar_deletar)
	#connect("area_entered", queue_free)


func tentar_deletar(area):
	queue_free()
	get_parent().mosca_morta += 1
	if get_parent().mosca_morta == 3:
		get_parent().register_win() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if area_entered:
		#queue_free()
		pass
