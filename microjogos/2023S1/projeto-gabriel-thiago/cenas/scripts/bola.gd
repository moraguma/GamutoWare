extends Area2D

@onready var mira = $"../mira"
#@onready var alvo = $"../alvo"
var chegouMira = false;
var comecouMov = false;
#var target = mira.position;

#var positionXDif = mira.position.x - position.x;
#var positionYDif = mira.position.y - position.y;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_select"):
		comecouMov = true
		$AnimationPlayer.play("chutei")
		
	if chegouMira == false && comecouMov == true:
				position = position.move_toward(mira.position, delta*3000)
				if(position == mira.position):
					chegouMira = true;
	
	if chegouMira == true:
		$Spritebola.hide()
	
	pass

	

func _on_area_entered(area):
	
	var acertou = false;
	#if area.name == "gol":
	if area.name == "alvo":
		#print("entrou alvo")
		#if saber:
		acertou = true
		print("ganho")
		$Spritebola.hide()
	pass # Replace with function body.
