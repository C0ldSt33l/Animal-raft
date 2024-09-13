extends Node

@export var basic_speed: float = 100.0
@export var basic_day_vision: float = 100.0
@export var basic_night_vision: float = 100.0
@export var basic_max_food: int = 100.0
@export var basic_storage: int = 50

var raft_velocity: Vector2 = Vector2(0,0)
 
var total_speed: float = basic_speed
var total_day_vision: float = basic_speed
var total_night_vision: float = basic_speed
var total_max_food: int = basic_max_food
var total_storage: int = basic_storage

var resource: Dictionary = {
	"wood": 0,
	"planks": 0,
	"ropes": 0,
	"nails": 0
}

var food: int = 0
var food_consumption: int = 0
var storage_filled: int = 0

func change_food(food_delta: int) -> void:
	food += food_delta
	if food < 0:
		food = 0
		
func change_resource(res_type: String, res_delta: int) -> void:
	if not resource.has(res_type):
		print_debug("Error, no such resource: " + res_type)
		return
	if res_delta > 0 and res_delta + storage_filled > total_storage:
			res_delta = total_storage - storage_filled
	resource[res_type] += res_delta
	storage_filled += res_delta
	if resource[res_type] < 0:
		resource[res_type] = 0
