extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello world!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("pause"):
		get_tree().quit()
