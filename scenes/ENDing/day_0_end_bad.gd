extends Node2D
@onready var biu = $ColorRect/Button/AudioStreamPlayer
func _on_button_pressed():
	biu.play()
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
