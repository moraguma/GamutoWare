extends Area2D

@onready var parent = get_parent()
@onready var player = get_node("../Player")
@onready var enemy = get_node("../Enemy")

func _ready():
	position.x = 570+player.BG_VEL*enemy.vel_mul * 5.8

func _process(_delta):
	position.y = floor(player.position.y/64.0)*64
	
func _on_body_entered(body):
	if(body == player):
		parent.register_win()
		player.won = true
	elif(body == enemy):
		parent.register_lose()
