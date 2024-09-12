class_name Enemy
extends TextureButton

signal chosen_enemy(enemy: Enemy)

# Called when the node enters the scene tree for the first time.
var HP = 20
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if HP<=0:
		queue_free()


func _on_pressed() -> void:
	self.chosen_enemy.emit(self)
	print('signal')
	#emit_signal('ChosenEnemy',self) # Replace with function body.
func TakeDamage(value: int ) -> void:
	HP-=value
