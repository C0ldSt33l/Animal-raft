class_name Enemy
extends TextureButton
# Called when the node enters the scene tree for the first time.
var HP = 20
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	emit_signal('ChosenEnemy',self) # Replace with function body.
func TakeDamage(value: int )-> void:
	HP-=value
