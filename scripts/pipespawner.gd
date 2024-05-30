extends Node2D

@onready var spawn_timer = $SpawnTimer
var pipeNode = preload("res://scenes/pipeset.tscn")
var yVariance = 170
var pipe_speed = 200

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
#if gets too hard after 50 but before 80, lower this 
	if score < 80:
		spawn_timer.wait_time -= 0.03
		print("new time: "+str(spawn_timer.wait_time))
	#if 0<score and score<80 and score%5 == 0:
		#spawn_timer.wait_time -= 0.15
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
	#if gets too hard before 50, lower this 
	if score < 50:
		pipe_speed += 1.5
	#if (0<score and score<60 and score%5 == 0):
		#print("speeding up")
		#pipe_speed += 10
	pipeInstance.speed = pipe_speed
	add_child(pipeInstance)
	
func hit_bird():
	score = 0
	hit_bird_signal.emit()
	
func add_point():
	score += 1
	score_label.text = str(score)
	
	
