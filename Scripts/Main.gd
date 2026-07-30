extends Node2D

var score = 0
var time_left = 30
var high_score = 0
var is_paused = false

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
	ball.ball_clicked.connect(_on_ball_clicked)
	
	pause_button.pressed.connect(_on_pause_pressed)
	resume_button.pressed.connect(_on_resume_pressed)
	pause_restart_button.pressed.connect(_on_pause_restart_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)
	load_high_score()

func _process(_delta):
	if game_timer.time_left > 0:
		timer_label.text = "Time: " + str(ceil(game_timer.time_left))

func _on_ball_clicked():
	if game_timer.time_left > 0:
		score += 1
		score_label.text = "Score: " + str(score)
		
	if score > high_score:
			high_score = score
			high_score_label.text = "High Score: " + str(high_score)
			save_high_score()	

func _on_game_timer_timeout():
	ball.game_over = true
	ball.set_process(false)

	timer_label.text = "Game Over!"

	restart_button.visible = true


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	
func load_high_score():
	if FileAccess.file_exists("user://highscore.save"):
		var file = FileAccess.open("user://highscore.save", FileAccess.READ)
		high_score = file.get_32()
		file.close()

	high_score_label.text = "High Score: " + str(high_score)	

func save_high_score():
	var file = FileAccess.open("user://highscore.save", FileAccess.WRITE)
	file.store_32(high_score)
	file.close()

func _on_pause_pressed():
	is_paused = true

	pause_panel.visible = true
	get_tree().paused = true


func _on_resume_pressed():
	is_paused = false

	pause_panel.visible = false
	get_tree().paused = false


func _on_pause_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
