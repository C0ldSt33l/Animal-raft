class_name Raft
extends Node2D


const ARRAY_SIZE := Vector2i(7, 7)
const CENTRE_CELL_POS := Vector2i(3, 3)
var cells: Array[Cell] = []

@export var speed: int
@export var fov: float

@export var cell_scen: PackedScene


func _ready() -> void:
	var cur_pos := Vector2i.ZERO 
	for row in range(self.ARRAY_SIZE.y):
		for col in range(self.ARRAY_SIZE.x):
			var cell := Cell.add_to_scene(self, Cell.TYPE.VOID)
			cell.position = cur_pos
			cell.pos_in_raft = Vector2i(col, row)
			cell.hide()

			self.cells.append(cell)

			cur_pos.x += Cell.CELL_SIZE.x + 10

		cur_pos.y += Cell.CELL_SIZE.y + 10
		cur_pos.x = 0

	var center := Cell.add_to_scene(self, Cell.TYPE.CENTER)
	self.set_cell(
		self.CENTRE_CELL_POS,
		center	
	)
	self.set_cell(
		Vector2i.ZERO,
		center
	)
		
	self._make_cells_visible([
		self.CENTRE_CELL_POS,

		self.CENTRE_CELL_POS + Vector2i(1, 1),
	 	self.CENTRE_CELL_POS + Vector2i(0, 1),
   		self.CENTRE_CELL_POS + Vector2i(-1, 1),

		self.CENTRE_CELL_POS + Vector2i(1, -1),
		self.CENTRE_CELL_POS + Vector2i(0, -1)	,
		self.CENTRE_CELL_POS + Vector2i(-1, -1),

		self.CENTRE_CELL_POS + Vector2i(1, 0),
		self.CENTRE_CELL_POS + Vector2i(-1, 0),
	])


func get_cell(pos: Vector2i) -> Cell:
	var index := self._coord_to_index(pos)

	return self.cells[index]


func set_cell(pos: Vector2i, new_cell: Cell, offset: Vector2 = Vector2.ZERO) -> void:
	var index := self._coord_to_index(pos)
	var old_cell := self.cells[index]

	new_cell.position = old_cell.position + offset
	new_cell.pos_in_raft = old_cell.pos_in_raft
	new_cell.is_handle_mouse = true

	self.cells[index] = new_cell
	self.remove_child(old_cell)


func get_centre_cell() -> Cell:
	return self.get_cell(self.CENTRE_CELL_POS)


func _make_cells_visible(positions: Array[Vector2i]) -> void:
	for pos in positions:
		var cell := self.get_cell(pos)
		cell.show()
		cell.is_handle_mouse = true


func _coord_to_index(pos: Vector2i) -> int:
	var x := pos.x
	var y := pos.y * self.ARRAY_SIZE.y

	return x + y
