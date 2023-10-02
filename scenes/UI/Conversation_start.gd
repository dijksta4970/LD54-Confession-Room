extends Control

@onready var lable = $TapHereToStart/Label

func _ready():
	lable.show()
	
	
	


func _on_tap_here_to_start_mouse_exited():
	lable.hide()


func _on_tap_here_to_start_mouse_entered():
	lable.show()
