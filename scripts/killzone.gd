extends Area2D

func _on_body_entered(body):
	print("You have died")
	#player.velocity.y = 0
	Engine.time_scale = 0
