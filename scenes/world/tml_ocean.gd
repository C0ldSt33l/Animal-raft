extends TileMapLayer

var timer:float = 0
var frame:int = 0
@export var animation_time: float = 0.1
@export var animation_shift_by_tile: int = 1
@export var tiles_columns: int = 7
@export var tiles_rows: int = 6
@export var total_frames: int = 39

var tiles: Array[Vector2i]
var sids: Array[int]
var cell_count: int

var raft_pos: Vector2
var ocean_last_pos: Vector2

func _ready() -> void:
	tiles = get_used_cells()
	cell_count = tiles.size()
	sids.resize(cell_count)
	for i in range(cell_count):
		sids[i] = self.get_cell_source_id(tiles[i])
	raft_pos = %Raft.position
	ocean_last_pos = %Raft.position
	
func _process(delta: float) -> void:
	ocean_animation_process(delta)
	update_ocean_position()
	
func ocean_animation_process(delta: float) -> void:
	timer += delta
	if timer > animation_time:
		timer -= animation_time
		frame = (frame+1) % total_frames
		#print_debug(frame, coord)
		for i in range(cell_count):
			var cframe = (frame + (tiles[i].x+tiles[i].y)*animation_shift_by_tile) % total_frames
			@warning_ignore("integer_division")
			var coord = Vector2i(cframe % tiles_columns, cframe / tiles_columns)
			self.set_cell(tiles[i], sids[i], coord)

func update_ocean_position() -> void:
	var raft_delta = %Raft.position - ocean_last_pos
	var dx:int = raft_delta.x
	var dy:int = raft_delta.y
	
	if int(dx / 128) > 0:
		position.x += 128
		ocean_last_pos.x += 128
	if int(dx / 128) < 0:
		position.x -= 128
		ocean_last_pos.x -= 128
	if int(dy / 128) > 0:
		position.y += 128
		ocean_last_pos.y += 128
	if int(dy / 128) < 0:
		position.y -= 128
		ocean_last_pos.y -= 128
