extends Node2D


const SPEED = 35

var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	
	position.x += direction * SPEED * delta


func _on_area_2d_body_entered(body):
	print("hello")
	if (body.name == "Player"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 60):
			print("Destroy enemy")
			animation_player.play("stomp")
			body.jump()
		else:
			print("Decrease player health")
			get_tree().reload_current_scene()
			
			
