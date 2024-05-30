extends Node2D

@onready var spawn_timer = $SpawnTimer
var pipeNode = preload("res://scenes/pipeset.tscn")
var yVariance = 170

@onready var score_label = $Label
@export var pipe_scene = PackedScene

signal hit_bird_signal

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_pipe()
	spawn_timer.start()


func _on_spawn_timer_timeout():
	print("timer done")
	spawn_pipe()
	
func spawn_pipe():
	print("spawning new pipe")
	var pipeInstance = pipeNode.instantiate()
	#print(get_viewport_rect().size.y/6)
	var yPosition = randf_range(-yVariance, yVariance)
	pipeInstance.position = Vector2(0, yPosition)
	#pipeInstance.position = Vector2(150, -yVariance)
	pipeInstance.scored.connect(add_point)
	pipeInstance.hit.connect(hit_bird)
	add_child(pipeInstance)
	
func hit_bird():
	hit_bird_signal.emit()
	
func add_point():
	score += 1
	score_label.text = str(score)
	
	
