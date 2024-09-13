class_name Enemy
extends TextureButton

signal chosen_enemy(enemy: Enemy)

@onready var hp_label = $HP as Label
@onready var attack_label = $Attack as Label

var attack :int = 5
# Called when the node enters the scene tree for the first time.
var HP :int = 20 
func _ready() -> void:
	pass
		 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hp_label.text = '♡' + str(HP)
	attack_label.text = "🗡" + str(attack)
	if HP<=0:
		queue_free()


func _on_pressed() -> void:
	self.chosen_enemy.emit(self)
	print('signal')
	#emit_signal('ChosenEnemy',self) # Replace with function body.
func TakeDamage(value: int ) -> void:
	HP-=value
	#print(HP)
func Heal(value: int) -> void:
	HP+=value
