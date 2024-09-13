class_name Cell
extends Node2D


signal cell_has_no_empty_space()

enum TYPE {
	VOID = -1,
	CENTER,
	BRANCH,
	WOOD,
	UPGRADED_BRANCH,
	UPGRADED_WOOD,
}

const CELL_SIZE := Vector2i(64, 64)
const CELL_HP_ARRAY: Array[int] = [INF, 3, 5, 5, 7]

const TEXTURE_ARRAY: Array[Texture2D] = [
	preload('res://raft_editor/textures/centre_cell.jpg'),
	preload('res://raft_editor/textures/branch_cell.jpg'),
	preload('res://raft_editor/textures/wood_cell.jpg'),
	# preload(''),
	# preload(''),
]

const _SCENE := preload('res://raft_editor/raft/cell.tscn')

@onready var texture_button := $TextureButton as TextureButton

var _health: int 
# var pos_in_raft := Vector2i(0, 0)

var store_unit: Node2D = null
var type: TYPE :
	set(value):
		type = value
		self._health = CELL_HP_ARRAY[value]

var border_color := Color.BLACK
var texture: Texture2D:
	set(value):
		self.texture_button.texture_normal = value
	get:
		return self.texture_button.texture_normal	

var is_mouse_inside := false
var pos_in_raft := Vector2i(-1, -1)
var is_handle_mouse: bool :
	set(value):
		var filter := Control.MOUSE_FILTER_STOP if value else Control.MOUSE_FILTER_IGNORE
		self.texture_button.mouse_filter = filter


func _ready() -> void:
	if (self.type == TYPE.VOID):
		self.texture = null
	else:
		self.texture = self.TEXTURE_ARRAY[self.type]

	self.is_handle_mouse = false


func _draw() -> void:
	const width := 4.0

	var rect := Rect2(Vector2.ZERO, self.CELL_SIZE)
	rect.position += Vector2(width, width) / 2
	
	draw_rect(rect, self.border_color, false, width)

	if self.store_unit:
		self.store_unit._draw()


func attach_unit(unit: Node2D) -> void:
	if !self.store_unit:
		self.cell_has_no_empty_space.emit()
		return
	
	print('unit is attached')
	self.store_unit = unit
	unit.position = self.position


func upgrade() -> void:
	match self.type:
		TYPE.BRANCH:
			pass
		TYPE.WOOD:
			pass
		_:
			print('this cell cant be upgraded')


static func add_to_scene(scene: Node, type: TYPE) -> Cell:
	var cell := _SCENE.instantiate() as Cell
	cell.type = type
	scene.add_child(cell)

	return cell


func _on_texture_button_mouse_entered() -> void:
	print('mouse enter in cell at ', self.pos_in_raft)
	self.is_mouse_inside = true


func _on_texture_button_mouse_exited() -> void:
	print('mouse exit from cell at ', self.pos_in_raft)
	self.is_mouse_inside = false
