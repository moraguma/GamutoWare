extends Sprite2D

var dentro = false
@onready var possis = [$"../locais/loc1",$"../locais/loc2",$"../locais/loc3"]
# Called when the node enters the scene tree for the first time.
func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var local = (randi()%3)
	self.set_position(possis[local].position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	dentro = true
	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	dentro = false
	pass # Replace with function body.
