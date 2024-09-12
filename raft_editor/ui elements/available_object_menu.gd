class_name AvailableObjectMenu
extends TabContainer


@onready var cells_tab := $Cells as ObjectTab
@onready var animals_tab := $Animals as ObjectTab
@onready var buildings_tab := $Buildings as ObjectTab

@onready var tabs: Array[ObjectTab] = [
	self.cells_tab,
	self.animals_tab,
	self.buildings_tab,
]


func _ready() -> void:
	self.cells_tab.add_cards({
		'Branch': Cell.TEXTURE_ARRAY[Cell.TYPE.BRANCH],
		'Wood': Cell.TEXTURE_ARRAY[Cell.TYPE.WOOD],
	})

	print('tabs: ', self.tabs)
	
