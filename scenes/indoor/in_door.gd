extends Node2D

@onready var player = $Player
@onready var transition = $transition

var granny_start = false
var girl_start = false


func _ready():
	transition.play("fadein")
	State.connect("_start_granny", _on_player_start_granny)
	State.connect("_start_girl", _on_player_start_girl)
	
func _process(_delta):
	if player.global_position.x < 0:
		player.global_position.x = 0
	if player.global_position.x > 660:
		player.global_position.x = 660
	if player.global_position.y < 245:
		player.global_position.y = 245
	if player.global_position.y > 350:
		player.global_position.y = 350


func _on_player_start_granny():
	transition.play("fadeout")
	granny_start = true
	
func _on_player_start_girl():
	transition.play("fadeout")
	girl_start = true



func _on_transition_animation_finished(_anim_name):
	if granny_start:
		get_tree().change_scene_to_file("res://scenes/room/confession_Lady.tscn")
	if girl_start:
		get_tree().change_scene_to_file("res://scenes/room/confession_girl.tscn")
