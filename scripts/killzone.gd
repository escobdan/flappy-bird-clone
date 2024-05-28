extends Area2D

func _on_body_entered(body):
	print("You have died")
	Engine.time_scale = 0.0
