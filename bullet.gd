extends Area2D

var speed = 50
var max_speed = 1000
var acceleration = 100
var direction = Vector2.RIGHT
var bullet_type: int = 0

func _physics_process(delta):
	speed = min(speed + acceleration * delta, max_speed)

	position += direction * speed * delta

func _on_screen_exited():
	queue_free()

func set_property(type):
	bullet_type = type

func _on_body_entered(body):
	
	if body.name == "Player":  
		end_game()


	body.end_game()

# Function to handle the game-over logic
func end_game():
	get_tree().quit()
