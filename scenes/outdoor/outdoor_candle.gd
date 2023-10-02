extends Area2D

@onready var animate = $AnimatedSprite2D
@onready var audio = $AudioStreamPlayer

var player_inside = false
var still_in_it = true
var first_time = true


func _on_body_exited(body):
	if body is Player: 
		still_in_it = false

func _on_body_entered(body):
	if body is Player:
		player_inside = true
		still_in_it = true

		
func _process(_delta):
	if player_inside:
		if Input.is_action_just_released("interact"):
			animate.play("light")
			if still_in_it and first_time:
				Value.add_value()
				var value = Value.get_value()
				Value.emit_signal("value_changed",value)
				audio.play()
				first_time = false
				









