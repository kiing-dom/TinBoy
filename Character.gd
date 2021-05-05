extends KinematicBody2D

var velocity = Vector2(0, 0)
const SPEED = 120
const JUMPFORCE = -600
const GRAVITY = 40

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x= -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("air")
	velocity.y = velocity.y + GRAVITY
	
	if	Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -600


# warning-ignore:return_value_discarded
	move_and_slide(velocity, Vector2.UP)

	velocity.x = lerp(velocity.x, 0, 0.2)



func _on_FallZone_body_entered(Character):
	get_tree().change_scene("res://Level1.tscn")


func _on_FallZone2_body_entered(body):
	get_tree().change_scene("res://Level2.tscn")

func _on_FallZone3_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")




