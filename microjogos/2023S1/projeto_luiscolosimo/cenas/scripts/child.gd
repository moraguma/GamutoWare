extends Area2D

var dentro = false
@onready var possis = [$"../locais/loc1",$"../locais/loc2",$"../locais/loc3"]
# Called when the node enters the scene tree for the first time.
func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var local = (randi()%3)
	self.set_position(possis[local].position)

func _on_cursor_entered(body: Node2D) -> void:
	dentro = true

func _on_cursor_exited(body: Node2D) -> void:
	dentro = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("acao") and dentro:
		$"Hide".hide()
		$"Show".show()
		get_parent().register_win()
