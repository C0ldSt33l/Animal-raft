extends TabContainer


@onready var cells_tab := $"Cells tab" as ObjectTab


func _ready() -> void:
	self.cells_tab.add_cards({
		'Branch': Cell.TEXTURE_ARRAY[Cell.CELL_TEXTURE.BRANCH_CELL],
		'Wood': Cell.TEXTURE_ARRAY[Cell.CELL_TEXTURE.WOOD_CELL],
	})
	pass
