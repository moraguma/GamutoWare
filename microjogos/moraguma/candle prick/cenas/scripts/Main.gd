extends Node2D


signal win
signal lose


const WIDTH = 240
const HEIGHT = 135


func _ready():
	$Wind.play()
	$Music.play()
