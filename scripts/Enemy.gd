extends KinematicBody2D

onready var player = get_parent().get_node("Player")

const SPEED = 200
var health = 10

func _process(delta):
	var direction = position.direction_to(player.position)
	var motion = direction * SPEED
	var coll = move_and_collide(motion * delta)
	if coll:
		if "Player" in coll.collider.name:
			coll.collider.hit()

func hit():
	health -= 5
	if health <= 0:
		queue_free()
