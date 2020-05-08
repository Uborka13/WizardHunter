extends Node

const FIREBALL = preload("res://scene/FireBall.tscn")
const ENEMY = preload("res://scene/Enemy.tscn")
onready var map_floor = $TileMap/Floor

func _ready():
	randomize()

func _on_Player_shoot():
	var fireball = FIREBALL.instance()
	add_child(fireball)
	var mouse_pos = $Player.position.direction_to($TileMap.get_global_mouse_position())
	var corrected_player_pos = $Player.position + mouse_pos * 40
	fireball.position = corrected_player_pos
	fireball.direction = mouse_pos

func _on_Timer_timeout():
	var x = randi() % 29 + 3
	var y = randi() % 29 + 3
	var enemy = ENEMY.instance()
	add_child(enemy)
	enemy.position = map_floor.map_to_world(Vector2(x,y))
