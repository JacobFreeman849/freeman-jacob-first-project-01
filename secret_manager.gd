extends Node


var score = 0


@onready var secret_label: Label = $SecretLabel

func add_point():
	score += 1
	secret_label.text = "You collected " +str(score) + " secret fruits"
