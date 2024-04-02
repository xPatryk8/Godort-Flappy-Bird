extends Node

class_name PipeSpawner

signal bird_crashed
signal scored

@export var speed = -160

var pipe_screne = preload("res://Objects/Pipe.tscn")

@onready var timer = $Timer

func _ready():
	timer.start()
	
func start_spawning_pipes():
	timer.timeout.connect(spawn_pipe)

func spawn_pipe():
	var pipe = pipe_screne.instantiate() as Pipe
	add_child(pipe)
	
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	pipe.position.x = viewport_rect.end.x
	
	pipe.position.y = randf_range(viewport_rect.size.y * 0.1, viewport_rect.size.y * 0.35)

	pipe.bird_crashed.connect(on_bird_entered)
	pipe.scored.connect(on_scored)
	pipe.set_speed(speed)
	
func on_bird_entered():
	bird_crashed.emit()
	stop()
	
func stop():
	timer.stop()
	for pipe in get_children().filter(func (child): return child is Pipe):
		(pipe as Pipe).speed = 0
	
func on_scored():
	scored.emit()
