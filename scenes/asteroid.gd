extends Area2D

@export var speed: float = 0.0
var direction: float = 0.0
var rotation_speed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rotation_speed
	position += speed * Vector2(cos(direction), sin(direction))


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Asteroid left screen")
	queue_free()


func _on_area_entered(area):
	print("Asteroid hit!")
