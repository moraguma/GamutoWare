extends RichTextLabel

func _on_timer_timeout() -> void:
	visible_characters +=1

func mostrar_texto(_text):
	text = _text
	visible_characters = 0
