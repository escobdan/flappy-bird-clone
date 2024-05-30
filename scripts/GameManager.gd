extends Node

@onready var gameStarted : bool = false
#@export var game_over = CanvasLayer
@onready var game_over = %GameOver
@onready var player = $"../Player"
@onready var label = $"../PipeSpawner/Label"

func _init():
	print("WELCOME")
	#game_over
	#game_over.visible = false
	Engine.time_scale = 0
	#print(get_viewport().size_2d_override)

func _input(event):
	if Input.is_action_just_pressed("flap") and !gameStarted:
		gameStarted = true
		Engine.time_scale = 1
		print("Starting game...")

func new_game():
	label.text = str(0)
	player.reset()
	gameStarted = false
	game_over.visible = false
	get_tree().call_group("pipes", "queue_free")
	Engine.time_scale = 0

func _on_game_over_restart():
	print("restarting game")
	new_game()


func _on_pipe_spawner_hit_bird_signal():
	print("showing button")
	game_over.visible = true


func _on_ceiling_hit_obstacle():
	game_over.visible = true


func _on_floor_hit_obstacle():
	game_over.visible = true
