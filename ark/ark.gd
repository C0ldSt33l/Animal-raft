class_name Ark
extends Node2D


const ARRAY_SIZE := Vector2i(7, 7)
const CENTRAL_CELL_POS := Vector2i(3, 3)
var cells: Array[Cell] = []

@export var health: int
@export var speed: int
@export var fov: float


func change_cell(pos: Vector2i, new_cell: Cell) -> void:
	print('pos: ', pos)
	print('new cell: ', new_cell)
	print('old cell: ', self.get_cell(pos))


func get_cell(pos: Vector2i) -> Cell:
	var line := pos.x * self.ARRAY_SIZE.x
	var col := pos.y

	return self.cells[line + col]


func _swap_cells(pos_1: Vector2i, pos_2: Vector2i) -> void:
	var cell_1 := self.get_cell(pos_1)
	var cell_2 := self.get_cell(pos_2)

	var tmp_pos := cell_1.position
	cell_1.position = cell_2.position
	cell_2.position = tmp_pos
