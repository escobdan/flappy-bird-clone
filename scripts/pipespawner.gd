extends Node2D

@onready var spawn_timer = $SpawnTimer
var pipeNode = preload("res://scenes/pipeset.tscn")
var yVariance = 170
var yscree

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnPipe()
	spawn_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	print("timer done")
	spawnPipe()
	
func spawnPipe():
	print("spawning new pipe")
	var pipeInstance = pipeNode.instantiate()
	#print(get_viewport_rect().size.y/6)
	var yPosition = randf_range(-yVariance, yVariance)
	pipeInstance.position = Vector2(0, yPosition)
	#pipeInstance.position = Vector2(150, -yVariance)
	add_child(pipeInstance)
	
	
