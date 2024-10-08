extends CharacterBody2D
const SPEED = 300.0

func _physics_process(_delta: float) -> void:
	var direction := Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if direction.length() > 0.01:
		velocity = direction * SPEED
	else:
		velocity = Vector2i(0,0)
	move_and_slide()
	
func _process(_delta: float) -> void:
	RaftData.raft_velocity = velocity
