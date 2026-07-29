extends Control

@onready var play_button = $MenuButtons/PlayButton
@onready var best_score_button = $MenuButtons/BestScoreButton

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	best_score_button.pressed.connect(_on_best_score_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_best_score_pressed():
	get_tree().change_scene_to_file("res://Scenes/BestScore.tscn")
