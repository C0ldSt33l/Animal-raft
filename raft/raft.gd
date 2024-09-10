class_name Raft
extends Node2D


const ARRAY_SIZE := Vector2i(7, 7)
const CENTRAL_CELL_POS := Vector2i(3, 3)
const CELL_START_POS := Vector2i(50, 50)
var cells: Array[Cell] = []

@export var health: int
@export var speed: int
@export var fov: float

@export var cell_scen: PackedScene


func _init() -> void:
	pass


func _ready() -> void:
	var cur_pos := self.CELL_START_POS 
	for row in range(self.ARRAY_SIZE.x):
		for col in range(self.ARRAY_SIZE.y):
			var cell := Cell.new(cur_pos)
			self.cells.append(cell)
			cur_pos.x += Cell.CELL_SIZE.x + 10

			self.add_child(cell)

		cur_pos.y += Cell.CELL_SIZE.y + 10
		cur_pos.x = self.CELL_START_POS.x
		
	self._make_cells_enabled([
		self.CENTRAL_CELL_POS,

		self.CENTRAL_CELL_POS + Vector2i(1, 1),
	 	self.CENTRAL_CELL_POS + Vector2i(0, 1),
   		self.CENTRAL_CELL_POS + Vector2i(-1, 1),

		self.CENTRAL_CELL_POS + Vector2i(1, -1),
		self.CENTRAL_CELL_POS + Vector2i(0, -1)	,
		self.CENTRAL_CELL_POS + Vector2i(-1, -1),

		self.CENTRAL_CELL_POS + Vector2i(1, 0),
		self.CENTRAL_CELL_POS + Vector2i(-1, 0),
	])


	# for i in range(self.ARRAY_SIZE.x):
	# 	var line: String
	# 	for j in range(self.ARRAY_SIZE.y):
	# 		line += str(self.cells[i + j].position)
	# 	print(line)


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


func _make_cells_enabled(positions: Array[Vector2i]) -> void:
	for pos in positions:
		self.get_cell(pos).disabled = false