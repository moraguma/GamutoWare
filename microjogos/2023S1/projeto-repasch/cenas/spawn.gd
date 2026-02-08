extends Node2D


func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var my_random_number = random.randf_range(10.0, 1900.0)
	self.set_position(Vector2(my_random_number,self.position.y)) 
	var options = load("res://microjogos/2023S1/projeto-repasch/cenas/comida.tscn").instantiate()
	self.add_child(options)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass



func _on_timer_timeout():
	spawn()
	pass # Replace with function body.
	
func spawn():
	var options = load("res://microjogos/2023S1/projeto-repasch/cenas/comida.tscn")
	var flagPrev = Vector2() 
	var flag = options.instantiate()
	var random = RandomNumberGenerator.new()
	random.randomize()
	var my_random_number = random.randf_range(10.0, 1900.0)
	var newPos =Vector2(my_random_number,self.position.y)
	flag.set_position(newPos)
	flagPrev = newPos #Update the previous in each flag spawn.
	get_tree().get_root().add_child(flag)
