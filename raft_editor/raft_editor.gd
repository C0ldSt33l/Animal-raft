extends Node2D


var selected_raft_cell: Cell = null
var selected_object: Node2D = null

@onready var raft := $"UI/Raft" as Raft
@onready var available_object_menu := $"UI/Available object menu" as AvailableObjectMenu


func _ready() -> void:
	self._setup_card_signal()


func _process(_delta: float) -> void:
	if !self.selected_object:
		return
	
	var mouse_local_pos := self.get_local_mouse_position()
	var raft_pos := self.raft.position
	var obj_size := Cell.CELL_SIZE as Vector2
	self.selected_object.position = mouse_local_pos - raft_pos - obj_size / 2
	if Input.is_action_pressed('click'):
		for cell in self.raft.cells:
			if cell.is_mouse_inside and cell.pos_in_raft != self.raft.CENTRE_CELL_POS:
				if self.selected_object is Cell:
					self.raft.set_cell(
						cell.pos_in_raft,
						self.selected_object as Cell,
					)
					self.selected_object = null
				elif !cell.store_unit:
					cell.attach_unit(selected_object)
					self.selected_object = null


func _setup_card_signal() -> void:
	for tab in self.available_object_menu.tabs:
		for card in tab.get_cards() as Array[ObjectCard]:
			card.selected_object.connect(self._create_obj)


func _create_obj(name: String) -> void:
	if self.selected_object:
		self.selected_object.queue_free()
		self.selected_object = null
		
	var new_object: Node2D 
	match name.to_lower():
		'branch':
			new_object = Cell.add_to_scene(self.raft, Cell.TYPE.BRANCH)
		'wood':
			new_object = Cell.add_to_scene(self.raft, Cell.TYPE.WOOD)
		_:
			print("object '", name, "' not exist")

	# new_object.hide()
	# self.disabled = true
	if new_object is Cell:
		new_object.is_handle_mouse = false
	print("object '", name, "' is created")
	
	self.selected_object = new_object
