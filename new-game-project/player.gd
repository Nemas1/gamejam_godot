extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var speed = 200 

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	if direction.x > 0:
		animated_sprite_2d.play("walk_right")
	elif direction.x < 0:
		animated_sprite_2d.play("walk_left")
	elif direction.y > 0:
		animated_sprite_2d.play("walk_down")
	elif direction.y < 0:
		animated_sprite_2d.play("walk_up")
	else:
		animated_sprite_2d.play("idle")
	
	move_and_slide()
	
