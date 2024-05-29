extends Node2D

var speed = 250
signal scored

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	
	if global_position.x < -160:
		print("destroyed pipe")
		queue_free()


func _on_score_area_body_entered(body):
	scored.emit()
