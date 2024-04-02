extends Node2D

class_name Pipe

signal scored
signal bird_crashed

var speed = 0

func set_speed(new_speed):
	speed = new_speed

func _process(delta):
	position.x += speed * delta

func _body_entered(body):
	bird_crashed.emit()
	
func _on_scored(body):
	scored.emit()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
