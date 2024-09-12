class_name ObjectTab
extends TabBar


@onready var _obj_container := $MarginContainer/HBoxContainer as HBoxContainer


#func _ready() -> void:
	#self.add_cards({
		#'Branch': Cell.TEXTURE_ARRAY[Cell.CELL_TEXTURE.BRANCH_CELL],
		#'Wood': Cell.TEXTURE_ARRAY[Cell.CELL_TEXTURE.WOOD_CELL],
	#})


func add_cards(data: Dictionary) -> void:
	for name in data:
		var card := ObjectCard._SCENE.instantiate() as ObjectCard
		self._obj_container.add_child(card)
		
		card.setup(name, data[name])


func get_cards() -> Array[ObjectCard]:
	return self.get_children() as Array[ObjectCard]
