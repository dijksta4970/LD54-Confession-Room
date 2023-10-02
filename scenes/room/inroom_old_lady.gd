extends AnimatedSprite2D

func _ready():
	Value.connect("value_changed", _on_player_value_changed)
	play_value(Value.get_value())
	
func _on_player_value_changed(new_value):
	play_value(new_value)

func play_value(new_value):
	var value = new_value
	if value == 3:
		play("2")
	elif value == 2:
		play("1")
	else:
		play("0")
		
