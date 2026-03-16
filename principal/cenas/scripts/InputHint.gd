extends Control

@onready var hint_nodes: Dictionary[StringName, Array] = {
	"cima": [$Gamepad/HBoxContainer/Dpad/Up, $Keyboard/HBoxContainer/ArrowKeys/Up],
	"baixo": [$Gamepad/HBoxContainer/Dpad/Down, $Keyboard/HBoxContainer/ArrowKeys/Down],
	"esquerda": [$Gamepad/HBoxContainer/Dpad/Left, $Keyboard/HBoxContainer/ArrowKeys/Left],
	"direita": [$Gamepad/HBoxContainer/Dpad/Right, $Keyboard/HBoxContainer/ArrowKeys/Right],
	"acao": [$Gamepad/HBoxContainer/Buttons/ButtonSouth, $Keyboard/HBoxContainer/SpaceBar]
}

@onready var gamepad: Control = $Gamepad
@onready var keyboard: Control = $Keyboard

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
	
	gamepad.visible = InputChecker.last_was_gamepad
	keyboard.visible = not InputChecker.last_was_gamepad
