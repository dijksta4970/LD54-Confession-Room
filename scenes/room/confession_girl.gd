extends Node2D

@onready var actionable = $confession_balloon_start
@onready var transition = $transition
var mouse_entered = false
var finish

func _ready():
	State.connect("_finish_girl", _on_player_finish_girl)
	transition.play("fadein")
	
	
func _input(event):
	if mouse_entered:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			actionable.action()
#			print("pressed")



func _on_confession_balloon_start_mouse_entered():
	mouse_entered = true


func _on_confession_balloon_start_mouse_exited():
	mouse_entered = false

func _on_player_finish_girl(state):
	finish = state
	transition.play("fadeout")



func _on_transition_animation_finished(anim_name):
	if anim_name == "fadeout":
		if finish == 1:
			get_tree().change_scene_to_file("res://scenes/ENDing/end_1.tscn")
		if finish == 2:
			get_tree().change_scene_to_file("res://scenes/ENDing/end_2.tscn")
		if finish == 3:
			get_tree().change_scene_to_file("res://scenes/ENDing/end_3.tscn")
	
