extends Sprite2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("acao") and get_parent().won:
		get_parent().get_node("Transformation").show()
		hide()
		get_node("../Body").hide()
		get_node("../Head").hide()
		get_node("../RightArm").hide()
		get_node("../LeftArm").hide()
		get_node("../Legs").hide()
		get_node("../Left").hide()
		get_node("../Right").hide()
		get_node("../Up").hide()
		get_node("../Down").hide()
		get_node("../NumberLeft").hide()
		get_node("../NumberRight").hide()
		get_node("../NumberUp").hide()
		get_node("../NumberDown").hide()
		get_node("../LetterLeft").hide()
		get_node("../LetterRight").hide()
		get_node("../LetterUp").hide()
		get_node("../LetterDown").hide()
		get_node("../..").register_win()
