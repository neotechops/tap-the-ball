extends Control

@onready var play_button = $MenuButtons/PlayButton
@onready var best_score_button = $MenuButtons/BestScoreButton
@onready var settings_button = $MenuButtons/SettingsButton

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	best_score_button.pressed.connect(_on_best_score_pressed)
	settings_button.pressed.connect(_on_settings_pressed)

func _on_play_pressed():
	AudioManager.play_button_click()
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_best_score_pressed():
	AudioManager.play_button_click()
	get_tree().change_scene_to_file("res://Scenes/BestScore.tscn")

func _on_settings_pressed():
	AudioManager.play_button_click()
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
	
func _on_exit_button_pressed():
	AudioManager.play_button_click()
	get_tree().quit()	
