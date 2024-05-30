extends Area2D

@export var speed: float = 200.0
var direction: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * Vector2(cos(direction), sin(direction)) * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Left screen	")
	queue_free()
