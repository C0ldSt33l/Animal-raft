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
	for row in range(self.ARRAY_SIZE.x):
		for col in range(self.ARRAY_SIZE.y):
			var cell := Cell.VOID_CELL
			cell.position = cur_pos
			# cell.hide()

			self.cells.append(cell)
			self.add_child(cell)

			cur_pos.x += Cell.CELL_SIZE.x + 10

		cur_pos.y += Cell.CELL_SIZE.y + 10
		cur_pos.x = 0
		
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

	self.change_cell(self.CENTRE_CELL_POS, Cell.CENTERE_CELL)


func change_cell(pos: Vector2i, cell: Cell) -> void:
	var index := pos.x * self.ARRAY_SIZE.x + pos.y
	cell.position =  self.cells[index].position

	remove_child(self.cells[index])

	self.cells[index] = cell
	add_child(cell)


func get_cell(pos: Vector2i) -> Cell:
	var line := pos.x * self.ARRAY_SIZE.x
	var col := pos.y

	return self.cells[line + col]


func get_centre_cell() -> Cell:
	return self.get_cell(self.CENTRE_CELL_POS)


func _swap_cells(pos_1: Vector2i, pos_2: Vector2i) -> void:
	var cell_1 := self.get_cell(pos_1)
	var cell_2 := self.get_cell(pos_2)

	var tmp_pos := cell_1.position
	cell_1.position = cell_2.position
	cell_2.position = tmp_pos


func _make_cells_visible(positions: Array[Vector2i]) -> void:
	for pos in positions:
		var cell := self.get_cell(pos)
		# cell.disabled = false
		cell.show()
