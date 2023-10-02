extends Node

var musics = [
	load("res://assets/music/New Composition #1.mp3"),
	load("res://assets/music/compose_new.mp3")
	]
	
@onready var music_player = $AudioStreamPlayer

func play_music():
	var music_index = randi() % musics.size()
	music_player.stream = musics[music_index]
	music_player.stream.loop = true
	music_player.play()
