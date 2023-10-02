extends Node2D

@onready var player = $Player
@onready var transition = $transition
var good = false

func _ready():
	transition.play("fadein")
	State.connect("day_0", _on_player_day_0)
	

func _process(_delta):
	if player.global_position.x < 0:
		player.global_position.x = 0
	if player.global_position.x > 660:
		get_tree().change_scene_to_file("res://scenes/ENDing/day_0_end_bad.tscn")
	if player.global_position.y < 245:
		player.global_position.y = 245
	if player.global_position.y > 350:
		player.global_position.y = 350
		
func _on_player_day_0(state):
	if state:
		transition.play("fadeout")
		good = state

		
	else:
		transition.play("fadeout")
		


func _on_transition_animation_finished(anim_name):
	if anim_name == "fadeout":
		if good:
			get_tree().change_scene_to_file("res://scenes/outdoor/day_0_good.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/ENDing/day_0_end_bad.tscn")


func _on_area_2d_body_entered(_body):
	player.speed = 50


func _on_area_2d_body_exited(_body):
	player.speed = 150
	
