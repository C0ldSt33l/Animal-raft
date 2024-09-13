class_name Raft
extends Node2D


const ARRAY_SIZE := Vector2i(7, 7)
const CENTRE_CELL_POS := Vector2i(3, 3)
var cells: Array[Cell] = []

@export var speed: int
@export var fov: float

@export var cell_scen: PackedScene


func _ready() -> void:
	self._setup_cells()
			
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


func set_cell(pos: Vector2i, new_cell: Cell) -> void:
	var index := self._coord_to_index(pos)
	var old_cell := self.cells[index]

	new_cell.position = old_cell.position 
	new_cell.pos_in_raft = pos
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


func _setup_cells() -> void:
	var cur_pos := Vector2i.ZERO 
	for row in range(self.ARRAY_SIZE.y):
		for col in range(self.ARRAY_SIZE.x):
			var cell: Cell
			if Vector2i(col, row) == self.CENTRE_CELL_POS:
				cell = Cell.add_to_scene(self, Cell.TYPE.CENTER)
			else:
				cell = Cell.add_to_scene(self, Cell.TYPE.VOID)
			cell.position = cur_pos
			cell.pos_in_raft = Vector2i(col, row)
			cell.hide()

			self.cells.append(cell)

			cur_pos.x += Cell.CELL_SIZE.x + 10

		cur_pos.y += Cell.CELL_SIZE.y + 10
		cur_pos.x = 0


func _get_pos_in_raft(pos: Vector2i) -> Vector2:
	var x := pos.x * Cell.CELL_SIZE.x
	var y := pos.y * Cell.CELL_SIZE.y

	return Vector2(x, y)
