class_name ObjectCard
extends Control


const _SCENE := preload('res://raft_editor/ui elements/object_card.tscn')
const CARD_SIZE := Vector2i(70, 90)

@onready var texture_rect := $"Panel/Object texture" as TextureRect
@onready var name_label := $"Panel/Object name" as Label

var texture: Texture2D :
	set(value):
		self.texture_rect.texture = value
	get:
		return self.texture_rect.texture
var text: String :
	set(value):
		self.name_label.text = value
	get:
		return self.name_label.text


func _ready() -> void:
	print("it's fucking joke! FUCK FUCK FUCK FUCK FUCK FUCK FUCK")


func setup(name: String, texture: Texture2D) -> void:
	self.text = name
	self.texture = texture
