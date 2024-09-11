class_name ObjectTab
extends TabBar


@onready var _obj_container := $MarginContainer/HBoxContainer as HBoxContainer


func add_cards(data: Dictionary) -> void:
	for name in data:
		var card := ObjectCard._SCENE.instantiate() as ObjectCard
		self._obj_container.add_child(card)
		
		card.setup(name, data[name])
		#card.text = name
		#card.texture = data[name]
