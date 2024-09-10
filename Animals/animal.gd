extends TextureButton

@export var _Name: String = "Chicken"
@export var _size: int = 0 
@export var Cooldawn: int = 0

@onready var sprite = $AnimatedSprite2D as AnimatedSprite2D
@onready var skills = $"/root/AnimalsSkill" 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play(_Name)
	sprite.scale.x = 2.5
	sprite.scale.y = 2.5  # Replace with function body.
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	emit_signal('ChosenAnial',self)
	print('signal')
	
func getName() -> String: 
	return _Name
