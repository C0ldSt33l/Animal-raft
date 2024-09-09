extends Node2D

var line: Line2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line.points.resize(2)
	line.set_point_position(0, position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
