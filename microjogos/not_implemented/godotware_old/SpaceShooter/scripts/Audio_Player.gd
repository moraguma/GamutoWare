# this script allows us to play the game's sounds and music

extends Node

# plays given parameter
func play(sample_name):
	get_node('Sample_Player').play(sample_name)