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

