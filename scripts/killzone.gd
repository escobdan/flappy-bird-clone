extends Area2D

signal hit_obstacle

func _on_body_entered(body):
	print("You have died")
	#game_over_canvas.visible = true
	#player.velocity.y = 0
	Engine.time_scale = 0
	hit_obstacle.emit()
