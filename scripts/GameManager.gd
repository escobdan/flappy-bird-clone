extends Node

@onready var gameStarted : bool = false
@onready var score_label = $Label

var score = 0

func _init():
	print("WELCOME")
	Engine.time_scale = 0
	#print(get_viewport().size_2d_override)

func _input(event):
	if Input.is_action_just_pressed("flap") and !gameStarted:
		gameStarted = true
		Engine.time_scale = 1
		print("Starting game...")
		
func add_point():
	score += 1
	score_label.text = str(score)
