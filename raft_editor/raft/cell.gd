class_name Cell
extends TextureButton


enum MATERIAL_TYPE {
	VOID = -1,
	BRANCH,
	WOOD,
}

const CELL_SIZE := Vector2i(64, 64)
const CELL_HP_ARRAY: Array[int] = [3, 5]

const TEXTURE_ARRAY: Array[Texture2D] = [
	preload('res://raft_editor/textures/centre_cell.jpg'),
	preload('res://raft_editor/textures/cell_placeholder.jpg'),
	preload('res://raft_editor/textures/cell_placeholder2.jpg'),
	# preload(''),
	# preload(''),
]

enum CELL_TEXTURE {
	VOID_CELL = -1,
	CENTRE_CELL,
	BRANCH_CELL,
	WOOD_CELL,
	UPGRADED_BRANCH_CELL,
	UPGRADED_WOOD_CELL,
}

const _SCENE := preload('res://raft_editor/raft/cell.tscn')

static var VOID_CELL := create().apply({
	'material_type': MATERIAL_TYPE.VOID,
	'texture_normal': null,
}) :
	get:
		return VOID_CELL.duplicate()
static var CENTERE_CELL := create().apply({
	'material_type': MATERIAL_TYPE.VOID,
	'texture_normal': TEXTURE_ARRAY[CELL_TEXTURE.CENTRE_CELL],
}) :
	get:
		return CENTERE_CELL.duplicate()
static var BRANCH_CELL := create().apply({
	'material_type': MATERIAL_TYPE.BRANCH,
	'texture_normal': TEXTURE_ARRAY[CELL_TEXTURE.BRANCH_CELL],
}) :
	get:
		return BRANCH_CELL.duplicate()
static var WOOD_CELL := create().apply({
	'material_type': MATERIAL_TYPE.BRANCH,
	'texture_normal': TEXTURE_ARRAY[CELL_TEXTURE.WOOD_CELL],
}) :
	get:
		return WOOD_CELL.duplicate()

@export var health: int 
# var pos_in_raft := Vector2i(0, 0)

var store_unit: Object = null
var material_type: MATERIAL_TYPE :
	set(value):
		material_type = value
		if value == MATERIAL_TYPE.VOID:
			return
		health = CELL_HP_ARRAY[value]

var border_color := Color.BLACK


# func _ready() -> void:
# 	self.hide()


func _draw() -> void:
	#if self.disabled:
		#return

	const width := 4.0

	var rect := Rect2(Vector2.ZERO, self.CELL_SIZE)
	# rect.size.x -= width
	# rect.size.y -= width
	rect.position += Vector2(width, width) / 2
	
	draw_rect(rect, self.border_color, false, width)
	#draw_texture(self.texture_normal, Vector2i(500, 500))

	if self.store_unit:
		self.store_unit._draw()


static func create() -> Cell:
	var cell := _SCENE.instantiate() as Cell
	return cell


func attach_unit(unit: Object) -> void:
	print('unit is attached')
	self.store_unit = unit


func apply(properties: Dictionary) -> Cell:
	for prop in properties:
		self[prop] = properties[prop]

	return self 


func upgrade() -> void:
	match self.material_type:
		MATERIAL_TYPE.BRANCH:
			pass
		MATERIAL_TYPE.WOOD:
			pass
		_:
			print('this cell cant be upgraded')


func _on_mouse_entered() -> void:
	print('description is showed')
	self.border_color = Color.RED


func _on_mouse_exited() -> void:
	print('description is hided')
	self.border_color = Color.BLACK


func _on_pressed() -> void:
	# self.texture_normal = self.TEXTURE_ARRAY[1]
	pass
