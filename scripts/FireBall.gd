extends KinematicBody2D

const SPEED = 700
const enemy = preload("res://scene/Enemy.tscn")

var direction = Vector2.ZERO

func _process(delta):
	var motion = direction * SPEED
	var coll = move_and_collide(motion * delta)
	if (coll):
		if (coll.collider is TileMap):
			queue_free()
		if ("Enemy" in coll.collider.name):
			coll.collider.hit()
			queue_free()
