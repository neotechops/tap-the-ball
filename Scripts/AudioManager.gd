extends Node

var button_player : AudioStreamPlayer
var ball_player : AudioStreamPlayer
var game_over_player : AudioStreamPlayer
var success_player : AudioStreamPlayer

func _ready():
	button_player = AudioStreamPlayer.new()
	button_player.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(button_player)

	button_player.stream = preload("res://Assests/Audio/SFX/button_click.mp3")
	
	ball_player = AudioStreamPlayer.new()
	ball_player.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(ball_player)
	
	ball_player.stream = preload("res://Assests/Audio/SFX/ball_pop.wav")

	game_over_player = AudioStreamPlayer.new()
	game_over_player.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(game_over_player)

	game_over_player.stream = preload("res://Assests/Audio/SFX/game_over.mp3")
	
	success_player = AudioStreamPlayer.new()
	success_player.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(success_player)

	success_player.stream = preload("res://Assests/Audio/SFX/success.mp3")
func play_button_click():
	if GameSettings.sound_enabled:
		button_player.play()

func play_ball_pop():
	if GameSettings.sound_enabled:
		ball_player.play()

func play_game_over():
	if GameSettings.sound_enabled:
		game_over_player.play()

func play_success():
	if GameSettings.sound_enabled:
		success_player.play()
