extends Area2D


@onready var secret_manager: Node = $"../SecretManager"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	secret_manager.add_point()
	animation_player.play("collect")
	
