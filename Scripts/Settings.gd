extends Control

@onready var sound_button = $SoundButton
@onready var music_button = $MusicButton
@onready var back_button = $BackButton

var sound_enabled = true
var music_enabled = true

func _ready():
	sound_button.pressed.connect(_on_sound_pressed)
	music_button.pressed.connect(_on_music_pressed)
	back_button.pressed.connect(_on_back_pressed)

func _on_sound_pressed():
	sound_enabled = !sound_enabled

	if sound_enabled:
		sound_button.text = "🔊 Sound : ON"
	else:
		sound_button.text = "🔇 Sound : OFF"

func _on_music_pressed():
	music_enabled = !music_enabled

	if music_enabled:
		music_button.text = "🎵 Music : ON"
	else:
		music_button.text = "🎵 Music : OFF"

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
