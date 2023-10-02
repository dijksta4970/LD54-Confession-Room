extends Node2D

@onready var transition = $transition
@onready var biu = $Button/AudioStreamPlayer

func _on_button_pressed():
	biu.play()
	transition.play("fadeout")
	



func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
