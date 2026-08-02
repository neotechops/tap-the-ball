extends Node2D

var score = 0
var time_left = 30
var is_paused = false
var new_high_score_celebrated = false

@onready var high_score_label = $HighScoreLabel
@onready var restart_button = $RestartButton
@onready var score_label = $ScoreLabel
@onready var timer_label = $TimerLabel
@onready var ball = $Ball
@onready var game_timer = $GameTimer
@onready var pause_button = $PauseButton
@onready var pause_panel = $PausePanel
@onready var resume_button = $PausePanel/ButtonContainer/ResumeButton
@onready var pause_restart_button = $PausePanel/ButtonContainer/RestartButton
@onready var main_menu_button = $PausePanel/ButtonContainer/MainMenuButton

func _ready():
	GameSettings.reset_high_score() # Uncomment the line only when testing as it is added to reset score to test.
	ball.ball_clicked.connect(_on_ball_clicked)
	
	pause_button.pressed.connect(_on_pause_pressed)
	resume_button.pressed.connect(_on_resume_pressed)
	pause_restart_button.pressed.connect(_on_pause_restart_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)
	high_score_label.text = "High Score: " + str(GameSettings.high_score)
	
func _process(_delta):
	if game_timer.time_left > 0:
		timer_label.text = "Time: " + str(ceil(game_timer.time_left))

func _on_ball_clicked():
	if game_timer.time_left > 0:
		score += 1
		score_label.text = "Score: " + str(score)
		
	if score > GameSettings.high_score:

		if !new_high_score_celebrated:
			AudioManager.play_success()
			new_high_score_celebrated = true

		GameSettings.high_score = score
		high_score_label.text = "High Score: " + str(GameSettings.high_score)
		GameSettings.save_high_score()

func _on_game_timer_timeout():
	AudioManager.play_game_over()
	ball.game_over = true
	ball.set_process(false)

	timer_label.text = "Game Over!"

	restart_button.visible = true


func _on_restart_button_pressed():
	AudioManager.play_button_click()
	get_tree().reload_current_scene()
	
func _on_pause_pressed():
	AudioManager.play_button_click()
	is_paused = true

	pause_panel.visible = true
	get_tree().paused = true


func _on_resume_pressed():
	AudioManager.play_button_click()
	is_paused = false

	pause_panel.visible = false
	get_tree().paused = false


func _on_pause_restart_pressed():
	AudioManager.play_button_click()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_main_menu_pressed():
	AudioManager.play_button_click()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
