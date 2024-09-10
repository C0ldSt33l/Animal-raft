extends Node2D

var Enemy_scene = preload("res://scenes/Enemy.tscn")
var animal_scene = preload("res://Animals/animal.tscn")

var Enemies = []
var animals = []

@onready var skills = $"/root/AnimalsSkill" 
@onready var dmg = $TakenDamage as Label

signal ChosenAnimal(Animal) 
var chose_animal

signal ChosenEnemy(enemy)
var chose_enemy

var TakenDamage: int  = 0

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
		add_child(animal)
	 # Replace with function body.

#тут будет уменьшение кулдауна всем животным в конце хода
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	dmg.text = "taken damage: " + str(TakenDamage) 
	if chose_animal and chose_enemy:
		skills.FUNC_DIC[chose_animal.getName][1].call(chose_enemy)


func _on_chosen_enemy(enemy: Variant) -> void:
	chose_enemy = enemy
	 # Replace with function body.


func _on_chosen_animal(Animal: Variant) -> void:
	chose_animal = Animal # Replace with function body.
