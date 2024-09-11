extends TabContainer


@onready var cells_tab := $Cells as ObjectTab
@onready var animals_tab := $Animals as ObjectTab
@onready var buildings_tab := $Buildings as ObjectTab


func _ready() -> void:
	self.cells_tab.add_cards({
		'Branch': Cell.TEXTURE_ARRAY[Cell.CELL_TEXTURE.BRANCH_CELL],
		'Wood': Cell.TEXTURE_ARRAY[Cell.CELL_TEXTURE.WOOD_CELL],
	})
	
