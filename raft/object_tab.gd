class_name ObjectTab
extends TabBar


@onready var _obj_container := $MarginContainer/HBoxContainer as HBoxContainer


func _ready() -> void:
	self.add_cards({
		'Branch': Cell.TEXTURE_ARRAY[Cell.CELL_TEXTURE.BRANCH_CELL],
		'Wood': Cell.TEXTURE_ARRAY[Cell.CELL_TEXTURE.WOOD_CELL],
	})
	
	#print(self._obj_container.get_child_count())
	#print(self._obj_container.get_children())
	#for card in self._obj_container.get_children() as Array[ObjectCard]:
		#print(card.object_name.text)
	#print('----')
	#for card in self.obj_array:
		#print(card.object_name.text)


func add_cards(data: Dictionary) -> void:
	for name in data:
		var card := ObjectCard._scene.instantiate() as ObjectCard
		self._obj_container.add_child(card)
		
		card.setup(name, data[name])
		#card.text = name
		#card.texture = data[name]
