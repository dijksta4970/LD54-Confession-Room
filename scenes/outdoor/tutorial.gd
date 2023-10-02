extends Node2D

@onready var transition = $transition
func _on_button_pressed():
	transition.play("fadeout")


func _on_transition_animation_finished(anim_name):
	if anim_name == "fadeout":
		get_tree().change_scene_to_file("res://scenes/main/main.tscn")
