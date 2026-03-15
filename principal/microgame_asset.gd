extends Resource

class_name MicrogameAsset

@export var cover: Texture2D

# Game title
@export var title_pt: StringName = "Microgame"
@export  var title_en: StringName = "Microgame"

# Credits
@export_multiline var credits_pt: String
@export_multiline var credits_en:String

# Start message
@export var start_message_pt: StringName
@export var start_message_en: StringName

# Main Scene
@export var main_scene: PackedScene

@export var difficulty: int

# Dimensions
## Sets microgame zoom so that screen dimensions, default is 1920x1080 (16:9)
@export var screen_dimensions: Vector2i = Vector2i(1920, 1080) :
	set(value):
		if value.x < 0:
			value.x = -value.x
		if value.x == 0:
			value.x = screen_dimensions.x
		if value.y < 0:
			value.y = -value.y
		if value.y == 0:
			value.y = screen_dimensions.y
		screen_dimensions = value
