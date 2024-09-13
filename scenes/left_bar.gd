extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_time_data()
	update_raft_data()
	pass

func update_time_data() ->void:
	%LabelTimeValue.text = TimeData.get_day() + ", " + TimeData.get_time()
	%LabelStormValue.text = TimeData.get_storm()

func update_raft_data() -> void:
	%LabelSpeed.text = str(RaftData.total_speed)
	%LabelDayVision.text = str(RaftData.total_day_vision)
	%LabelNightVision.text = str(RaftData.total_night_vision)
	%LabelFoodValue.text = str(RaftData.food) + " / " + str(RaftData.total_max_food)
	%LabelConsumptionValue.text = str(RaftData.food_consumption)
	%LabelWoodValue.text = str(RaftData.resource["wood"])
	%LabelPlanksValue.text = str(RaftData.resource["planks"])
	%LabelRopesValue.text = str(RaftData.resource["ropes"])
	%LabelNailsValue.text = str(RaftData.resource["nails"])	
	%LabelStorageValue.text =  str(RaftData.storage_filled) + " / " + str(RaftData.total_storage)
