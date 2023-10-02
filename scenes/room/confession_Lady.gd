extends Node2D

@onready var actionable = $confession_balloon_start

var mouse_entered = false

func _ready():
	State.connect("_finish_granny", _on_player_finish_granny)
	
func _input(event):
	if mouse_entered:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			actionable.action()
#			print("pressed")



func _on_confession_balloon_start_mouse_entered():
	mouse_entered = true



func _on_confession_balloon_start_mouse_exited():
	mouse_entered = false

func _on_player_finish_granny(_state):
		get_tree().change_scene_to_file("res://scenes/indoor/in_door.tscn")
