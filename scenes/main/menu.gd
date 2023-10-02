extends Control

@onready var transition = $transition
@onready var biu = $AudioStreamPlayer
var start_pressed = false
var tutorial_pressed = false

func _on_start_pressed():
	biu.play()
	transition.play("fadeout")
	start_pressed = true
	


func _on_tutorial_pressed():
	biu.play()
	transition.play("fadeout")
	tutorial_pressed = true
	

func _on_quit_pressed():
	biu.play()
	get_tree().quit()




func _on_transition_animation_finished(anim_name):
	if anim_name == "fadeout":
		if start_pressed:
			get_tree().change_scene_to_file("res://scenes/outdoor/day_0_night.tscn")
		if tutorial_pressed:
			get_tree().change_scene_to_file("res://scenes/outdoor/tutorial.tscn")

