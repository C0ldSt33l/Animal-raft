class_name Animal
extends TextureButton

@export var _Name: String = "Chicken"
@export var _size: int = 0 
@export var Cooldawn: int = 3
var tmpCooldawn: int = 0


@onready var sprite = $AnimatedSprite2D as AnimatedSprite2D
@onready var skills = $"/root/AnimalsSkill" 
@onready var info = $Info
@onready var info_label = $Info/Label

signal choosen_animal(animal: Animal)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play(_Name)
	sprite.scale.x = 2.5
	sprite.scale.y = 2.5  # Replace with function body.
	info_label.text = skills.Animal_Info.get(_Name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	#emit_signal('ChosenAnimal',self)
	if self.tmpCooldawn == 0:
#		tmpCooldawn = Cooldawn
		self.choosen_animal.emit(self)
		print('signal')
	else:
		print(tmpCooldawn)
	
func getName() -> String: 
	return _Name


func _on_mouse_entered() -> void:
	info.popup_centered() # Replace with function body.


func _on_mouse_exited() -> void:
	info.hide() # Replace with function body.
