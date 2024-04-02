extends CanvasLayer

@onready var points_label1 = $MarginContainer/PointsLabel
@onready var game_over_box = $MarginContainer/GameOverBox
@onready var points_label2 = $MarginContainer/GameOverBox/Panel/PointsLabel

func _ready():
	points_label.text = 0

func update_points(points: int):
	points_label.text = points 

func on_game_over():
	
