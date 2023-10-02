extends CharacterBody2D
class_name Player

@onready var player_animated = $Animated
@onready var actionable_finder = $actionableFinder
@export var speed = 150.0

var direction : Vector2 = Vector2.ZERO

func animate_play(_vector):
	if direction.x != 0:
		player_animated.play("walk")
	elif Input.is_action_pressed("interact"):
		player_animated.play("interact")
	else:
		player_animated.play("idle")
		
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("talk"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			direction = Vector2.ZERO
			return
			
	var x_axis: float = Input.get_axis("move_left", "move_right")
	var y_axis: float = Input.get_axis("move_up", "move_down")
	
	if x_axis:
		direction = x_axis * Vector2.RIGHT
	elif y_axis:
		direction = y_axis * Vector2.DOWN
	else:
		direction = Vector2.ZERO
		
func _physics_process(_delta):
	if direction.length() > 0:
		velocity = direction * speed

	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)


	move_and_slide()

	if direction.x != 0:
		player_animated.flip_h = (direction.x == -1)


	animate_play(direction)
	
	
