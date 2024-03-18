extends CharacterBody2D

@export var speed = 400
@export var runspeed = 500
var sprinting = false

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed
	
	if Input.is_action_pressed("Sprint"):
		velocity = input_direction * runspeed
	else:
		velocity = input_direction * speed
		
		if Input.is_action_pressed("Left"):
			$Sprite2D.flip_h = true
			$AnimationPlayer.play("Walk_R")
		elif Input.is_action_pressed("Right"):
			$Sprite2D.flip_h = false
			$AnimationPlayer.play("Walk_R")
		elif Input.is_action_pressed("Down"):
			$Sprite2D.flip_h = true
			$AnimationPlayer.play("Walk_U")
		elif Input.is_action_pressed("Up"):
			$Sprite2D.flip_h = false
			$AnimationPlayer.play("Walk_U")
		else:
			$AnimationPlayer.play("Idle")

func _input(event):
	pass

func _physics_process(delta):
	get_input()
	move_and_slide()
