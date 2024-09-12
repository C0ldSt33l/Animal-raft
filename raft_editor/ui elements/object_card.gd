class_name ObjectCard
extends Control


signal selected_object(name: String)

const _SCENE := preload('res://raft_editor/ui elements/object_card.tscn')
const CARD_SIZE := Vector2i(70, 90)

@onready var texture_rect := $"Panel/Object texture" as TextureRect
@onready var name_label := $"Panel/Object name" as Label
@onready var panel := $"Panel" as Panel

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


func setup(name: String, texture: Texture2D) -> void:
	self.text = name
	self.texture = texture
	

func _on_panel_mouse_entered() -> void:
	const scale := Vector2(0.9, 0.9)
	self.scale = scale


func _on_panel_mouse_exited() -> void:
	const scale := Vector2(1, 1)
	self.scale = scale


func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed('click'):
			self.selected_object.emit(self.text)
