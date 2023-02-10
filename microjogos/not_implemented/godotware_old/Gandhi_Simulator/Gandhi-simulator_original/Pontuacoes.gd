extends CollisionShape2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	pass


func _on_Area2D_body_enter( body ):
	if body.get_name() == "Soldado" or body.get_name() == "Soldado1" or body.get_name() == "Soldado2" or body.get_name() == "Soldado3" or body.get_name() == "Soldado4" or body.get_name() == "Churchill":
		get_parent().get_parent().set_pos(Vector2(-20,-20))
		get_parent().get_parent().get_parent().get_parent().lost()
	pass # replace with function body
