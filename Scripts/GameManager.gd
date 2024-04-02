extends Node

@onready var bird = $"../Flappy Bird" as Bird
@onready var ground = $"../Ground" as Ground
@onready var pipe_spawner = $"../PipeSpawner" as PipeSpawner

var points = 0

func _ready():
	bird.started.connect(on_started)
	ground.bird_crashed.connect(on_end_game)
	pipe_spawner.bird_crashed.connect(on_end_game)
	pipe_spawner.scored.connect(on_scored)

func on_started():
	pipe_spawner.start_spawning_pipes()

func on_end_game():
	ground.stop()
	bird.kill()
	pipe_spawner.stop()

func on_scored():
	points += 1
	print(points)
