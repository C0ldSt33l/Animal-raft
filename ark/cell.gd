class_name Cell
extends TextureButton


enum MATERIAL_TYPE {
	VOID = -1,
	BRANCH,
	WOOD,
}

const CELL_SIZE := Vector2i(64, 64)
const CELL_HP_ARRAY := [50, 100]

@export var health: int 

var store_unit: Object = null
var material_type: MATERIAL_TYPE

var enabled: bool


func _init(
	pos: Vector2i = Vector2i.ZERO,
	type: MATERIAL_TYPE = MATERIAL_TYPE.VOID,
	enable: bool = true
) -> void:
	self.material_type = type
	self.health = self.CELL_HP_ARRAY[type]
	self.set_pos(pos)
	self.enabled = enable


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _draw() -> void:
	const width := 4.0

	var rect := Rect2(Vector2.ZERO, self.CELL_SIZE)
	# rect.size.x -= width
	# rect.size.y -= width
	rect.position += Vector2(width, width) / 2
	
	draw_rect(rect, Color.BLACK, false, width)

	if self.store_unit:
		self.store_unit._draw()


func attach_unit(unit: Variant) -> void:
	print('unit is attached')
	self.store_unit = unit


func set_pos(pos: Vector2) -> void:
	self.position = pos - Vector2(self.CELL_SIZE / 2)
