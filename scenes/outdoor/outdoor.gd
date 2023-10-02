extends Node2D

@onready var to_indoor = $ToInDoor
@onready var player = $Player
@onready var transition = $transition

func _ready():
	transition.play("fadein")
	
func _process(_delta):
	if player.global_position.x < 0:
		player.global_position.x = 0
	if player.global_position.y < 245:
		player.global_position.y = 245
	if player.global_position.y > 350:
		player.global_position.y = 350
		
	if player.global_position.x > 104 and player.global_position.x < 152 and player.global_position.x > 288 and player.global_position.x < 382 and player.global_position.x > 521 and player.global_position.x < 569:
		if player.global_position.y < 248:
			player.global_position.y = 248
			
		
func _on_to_in_door_body_entered(body):
	if body is Player:
		transition.play("fadeout")





func _on_transition_animation_finished(anim_name):
	if anim_name == "fadeout":
		get_tree().change_scene_to_file("res://scenes/indoor/in_door.tscn")
