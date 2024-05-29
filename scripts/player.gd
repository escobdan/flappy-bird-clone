extends CharacterBody2D


const SPEED = 300.0
const MAX_VEL = 600
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("flap"):
		velocity.y = JUMP_VELOCITY
	animated_sprite.play()
	set_rotation(deg_to_rad(velocity.y * 0.05))
	
	#print(velocity.y)
	#if velocity.y > 0:
		#set_rotation(PI/2)

	 #Get the input direction and handle the movement/deceleration.
	 #As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	move_and_slide()
