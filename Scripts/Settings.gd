extends Control

@onready var sound_button = $SettingsButtons/SoundButton
@onready var music_button = $SettingsButtons/MusicButton
@onready var back_button = $SettingsButtons/BackButton


func _ready():
	sound_button.pressed.connect(_on_sound_pressed)
	music_button.pressed.connect(_on_music_pressed)
	back_button.pressed.connect(_on_back_pressed)
	
	if GameSettings.sound_enabled:
		sound_button.text = "🔊 Sound : ON"
	else:
		sound_button.text = "🔇 Sound : OFF"

	if GameSettings.music_enabled:
		music_button.text = "🎵 Music : ON"
	else:
		music_button.text = "🎵 Music : OFF"

func _on_sound_pressed():
	AudioManager.play_button_click()
	GameSettings.sound_enabled = !GameSettings.sound_enabled

	if GameSettings.sound_enabled:
		sound_button.text = "🔊 Sound : ON"
	else:
		sound_button.text = "🔇 Sound : OFF"

func _on_music_pressed():
	AudioManager.play_button_click()
	GameSettings.music_enabled = !GameSettings.music_enabled

	if GameSettings.music_enabled:
		music_button.text = "🎵 Music : ON"
	else:
		music_button.text = "🎵 Music : OFF"

func _on_back_pressed():
	AudioManager.play_button_click()
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
