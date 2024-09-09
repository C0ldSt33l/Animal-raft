extends Node2D

var line: Line2D
var points: Array = []  # Массив для сохранения точек
var Draving: bool = false

func _ready():
	line = $Line2D
	line.points = points  # Устанавливаем начальные точки

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		# Добавляем новую точку в массив
		Draving = true
		points.append(get_global_mouse_position())
		
		line.points = points  # Устанавливаем массив точек в Line2D

		# Увеличиваем количество точек, если нужно
		if points.size() > 2:
			points.clear()  # Удаляем старую точку, если больше двух
			Draving = false
		line.points = points  # Переназначаем точки в Line2D

func _process(delta: float) -> void:
	if Draving and points.size() == 1:
		var mouse_pos = get_global_mouse_position()
		points.append(mouse_pos)
		line.points = points
		points.remove_at(1)
	pass
