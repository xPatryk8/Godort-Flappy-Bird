extends Node2D

class_name Ground

signal bird_crashed

@export var speed = -150

@onready var ground1 = $Ground1/Ground
@onready var ground2 = $Ground2/Ground

func _ready():
	ground2.global_position.x = ground1.global_position.x + ground1.texture.get_width()

func _process(delta):
	ground1.global_position.x += speed * delta
	ground2.global_position.x += speed * delta

	if ground1.global_position.x < -ground1.texture.get_width():
		ground1.global_position.x = ground2.global_position.x + ground2.texture.get_width()
		
	if ground2.global_position.x < -ground2.texture.get_width():
		ground2.global_position.x = ground1.global_position.x + ground1.texture.get_width()


func _body_entered(body):
	bird_crashed.emit()
	stop()
	(body as Bird).stop()
	
func stop():
	speed = 0
	
