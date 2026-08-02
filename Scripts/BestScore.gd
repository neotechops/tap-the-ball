extends Control

@onready var high_score_label = $HighScoreLabel
@onready var back_button = $BackButton

func _ready():
	high_score_label.text = "High Score: " + str(GameSettings.high_score)
	back_button.pressed.connect(_on_back_pressed)

func load_high_score():
	var high_score = 0

	if FileAccess.file_exists("user://highscore.save"):
		var file = FileAccess.open("user://highscore.save", FileAccess.READ)
		high_score = file.get_32()
		file.close()

	high_score_label.text = "High Score: " + str(GameSettings.high_score)

func _on_back_pressed():
	AudioManager.play_button_click()
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
