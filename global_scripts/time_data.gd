extends Node

var game_time_pause: bool = false
var day: int = 1
var time_val_sec: float = 0
const TIME_SPEED: float = 20 # game minutes per real second

const STORM_PERIOD:int = 6
var storm_in: int = STORM_PERIOD

const MORNING_TIME: = 6*60*60 # day starts at 06:00
const EVENING_TIME: = 18*60*60 # night starts at 18:00

func _process(delta: float) -> void:
	if not game_time_pause and RaftData.raft_velocity.length() >= 0.0001:
		time_val_sec += delta*TIME_SPEED*60
	update_time()
	pass

func update_time() -> void:
	if time_val_sec >= 24*60*60:
		day += 1
		time_val_sec = 0
		storm_in -= 1
		if storm_in < 0:
			storm_in = STORM_PERIOD

func add_time_spent_hours(spent_time: float) -> void:
	time_val_sec += spent_time*60*60
	update_time()
	
func add_time_spent_minutes(spent_time: float) -> void:
	time_val_sec += spent_time*60
	update_time()

func get_day() -> String:
	return "Day " + str(day)

func get_time() -> String:
	var h:int = int(time_val_sec) / (60*60) % 24
	var m:int = int(time_val_sec) / 60 % 60
	return "%02d:%02d" % [h, m]

func is_night() -> bool:
	return time_val_sec < MORNING_TIME or time_val_sec >= EVENING_TIME
	
func is_day() -> bool:
	return time_val_sec >= MORNING_TIME and time_val_sec < EVENING_TIME
	
func get_storm() -> String:
	if storm_in > 0:
		return "in " + str(storm_in) + " nights"
	return "next night"
