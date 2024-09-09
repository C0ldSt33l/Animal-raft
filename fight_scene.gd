extends Node2D

var animal_scene = preload("res://Animals/animal.tscn")
var n = 20
var points2D = [
	Vector2i(360,250),
	Vector2i(360,350),
	Vector2i(360,450),
	Vector2i(360,550),
	Vector2i(360,650),
	Vector2i(570,300),
	Vector2i(570,400),
	Vector2i(570,500),
	Vector2i(570,600),
	Vector2i(780,350),
	Vector2i(780,450),
	Vector2i(780,550),
	Vector2i(990,400),
	Vector2i(990,500),
	Vector2i(1200,450),
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 15:
		var animal = animal_scene.instantiate()
		animal._Name = 'Gorilla'
		animal._size = 3
		animal.position = points2D[i]
		n+=20
		add_child(animal)
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
