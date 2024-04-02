extends CharacterBody2D

class_name Bird

signal started

@export var gravity = 900
@export var jump_force = -250

@onready var sprite = $FlappyBird
@onready var animation_player = $AnimationPlayer

var max_speed = 400
var is_started = false
var can_jump = true

func jump():
	velocity.y = jump_force

func _ready():
	velocity = Vector2.ZERO
	animation_player.play("Idle")

func _physics_process(delta):
	if Input.is_action_just_pressed("LClick") and can_jump:
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "rotation", -1, 0.08)
		tween.tween_property(sprite, "rotation", 0, 0.08)
		if !is_started:
			animation_player.play("Idle")
			is_started = true
			started.emit()
		jump()
	
	if !is_started:
		return
	
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, max_speed)
	
	move_and_collide(velocity * delta)
	
func stop():
	animation_player.stop()
	gravity = 0
	velocity = Vector2.ZERO
	can_jump = false

func kill():
	can_jump = false
