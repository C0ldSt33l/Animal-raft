extends Node2D

var Enemy_scene = preload("res://scenes/Enemy.tscn")
var animal_scene = preload("res://Animals/animal.tscn")
var Enemies = []
var animals = []
var tern: int = 0
var win: bool = true
@onready var skills = $"/root/AnimalsSkill" 
@onready var dmg = $TakenDamage as Label
@onready var Energy = $Energy as Label
@onready var Win = $win as Popup


signal ChosenAnimal(Animal) 
var chose_animal

signal ChosenEnemy(enemy)
var chose_enemy
var fullEnergy: int = 5
var tmpEnergy: int = 0

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
	tmpEnergy = fullEnergy
	for i in 13:
		var animal := animal_scene.instantiate() as Animal
		animal._Name = 'Skunk'
		animal._size = 3
		animal.position = points2D[i]
		animals.append(animal)
		add_child(animal)
		
		animal.choosen_animal.connect(self._on_chosen_animal)
	for i in range(13,15):
		var enemy := Enemy_scene.instantiate() as Enemy
		add_child(enemy)
		Enemies.append(enemy)
		enemy.chosen_enemy.connect(self._on_chosen_enemy)
		enemy.position = points2D[i]

#тут будет уменьшение кулдауна всем животным в конце хода
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#labels
	win = true
	dmg.text = "taken damage: " + str(TakenDamage) 
	Energy.text = "Energy: " + str(tmpEnergy)
	#fight 
	if chose_animal and chose_enemy!=null and tmpEnergy>=0:
		tmpEnergy-= 1
		chose_animal.tmpCooldawn = chose_animal.Cooldawn
		skills.FUNC_DIC[chose_animal.getName()][1].call(chose_enemy)
		chose_animal = null
		chose_enemy = null
	
	if Enemies.is_empty():
		Win.popup_centered()


func _on_chosen_enemy(Enemy: Variant) -> void:
	chose_enemy = Enemy
	print('have enemy')
	 # Replace with function body.


func _on_chosen_animal(Animal: Variant) -> void:
	chose_animal = Animal # Replace with function body.
	print('have animal')


func _on_next_tern_pressed() -> void:
	print('next tern')
	tern+=1
	tmpEnergy = fullEnergy
	for i:Animal in animals:
			if i.tmpCooldawn>0:
				i.tmpCooldawn-=1
				
	for i:Enemy in Enemies:
			TakenDamage+=i.attack
