extends Node2D

@onready var transition = $transition

func _ready():
	transition.play("fadein")
	if State.Music_start == false:
		Music.play_music()
		State.Music_start = true
	


