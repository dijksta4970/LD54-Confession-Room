extends Node

signal value_changed(new_value)

@export var MAX_VALUE = 3
@export var MIN_VALUE = 0
var value = 1

func get_value():
	return value

func add_value():
	value += 1
	if value > MAX_VALUE:
		value = MAX_VALUE

func minus_value():
	value -= 1
	if value < MIN_VALUE:
		value = MIN_VALUE
