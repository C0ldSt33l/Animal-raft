extends Node2D


var selected_raft_cell: Cell = null
var selected_object: Node2D = null

@onready var raft := $Raft as Raft
@onready var available_object_menu := $"Available object menu" as AvailableObjectMenu


var click_on_cell_count := 0

func _ready() -> void:
	self._setup_card_signal()


func _process(_delta: float) -> void:
	if self.selected_object:
		self.selected_object.position = self.get_local_mouse_position()
		if Input.is_action_pressed('click'):
			for cell in self.raft.cells:
				if cell.is_mouse_inside:
					print('click')
					print('cell at ', cell.pos_in_raft, ' time ', self.click_on_cell_count)
					self.click_on_cell_count += 1
					if self.selected_object is Cell:
						print('cell is setted by coord: ', cell.pos_in_raft)
						self.raft.set_cell(
							cell.pos_in_raft,
							self.selected_object as Cell,
							self.raft.position
						)
					else:
						cell.attach_unit(selected_object)
					self.selected_object = null
			pass


func _setup_card_signal() -> void:
	for tab in self.available_object_menu.tabs:
		for card in tab.get_cards() as Array[ObjectCard]:
			card.selected_object.connect(self._create_obj)


func _create_obj(name: String) -> void:
	var new_object: Node2D 
	match name.to_lower():
		'branch':
			new_object = Cell.add_to_scene(self, Cell.TYPE.BRANCH)
		'wood':
			new_object = Cell.add_to_scene(self, Cell.TYPE.WOOD)
		_:
			print("object '", name, "' not exist")

	# new_object.hide()
	# self.disabled = true
	if new_object is Cell:
		new_object.is_handle_mouse = false
	print("object '", name, "' is created")
	self.selected_object = new_object
