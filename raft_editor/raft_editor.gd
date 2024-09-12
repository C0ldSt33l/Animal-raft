extends Node2D


var selected_raft_cell: Cell = null
var selected_object: Node2D = null

@onready var raft := $Raft as Raft
@onready var available_object_menu := $"Available object menu" as TabContainer


func _ready() -> void:
	var s := ObjectCard.new()


func _process(_delta: float) -> void:
	if self.selected_object:
		self.selected_object.position = self.get_local_mouse_position()
