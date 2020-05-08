extends KinematicBody2D
signal shoot

const MAX_SPEED = 300
var motion = Vector2()
var velocity = Vector2.ZERO

var health = 30

func get_input():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector

func _physics_process(delta):
	if Input.is_action_just_pressed("mouse_left"):
		emit_signal("shoot")
	var input_vector = get_input()
	if input_vector != Vector2.ZERO:
		velocity = input_vector
		if velocity.x > 0:
			$AnimatedSprite.play("Right")
		if velocity.x < 0:
			$AnimatedSprite.play("Left")
	else: 
		velocity = Vector2.ZERO
		$AnimatedSprite.play("Idle")
	move_and_collide(input_vector * delta * MAX_SPEED)
	
func hit():
	health -= 10
	if (health <= 0):
		queue_free()


