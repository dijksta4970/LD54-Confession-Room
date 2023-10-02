extends Node2D

@onready var transition = $transition
func _on_timer_timeout():
	transition.play("fadeout")
	


func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/outdoor/outdoor.tscn")
