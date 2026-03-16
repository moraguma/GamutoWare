extends Control

@onready var hint_nodes: Dictionary[StringName, Array] = {
	"cima": [$Gamepad/HBoxContainer/Dpad/Up],
	"baixo": [$Gamepad/HBoxContainer/Dpad/Down],
	"esquerda": [$Gamepad/HBoxContainer/Dpad/Left],
	"direita": [$Gamepad/HBoxContainer/Dpad/Right],
	"acao": [$Gamepad/HBoxContainer/Buttons/ButtonSouth]
}

func display_microgame_actions(microgame: MicrogameAsset) -> void:
	var actions: Array[StringName] = []
	
	if microgame.input_cima: actions.append("cima")
	if microgame.input_baixo: actions.append("baixo")
	if microgame.input_esquerda: actions.append("esquerda")
	if microgame.input_direita: actions.append("direita")
	if microgame.input_acao: actions.append("acao")
	
	for action in hint_nodes.keys():
		for node:Control in hint_nodes[action]:
			node.visible = action in actions
