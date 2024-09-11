extends Node2D


var selected_raft_cell: Cell = null
var selected_object: Object = null

@onready var raft := $Raft as Raft


func _process(_delta: float) -> void:
	var new_cell := Cell.WOOD_CELL
