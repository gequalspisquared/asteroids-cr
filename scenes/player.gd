extends Area2D

@export var Bullet: PackedScene

@export var acceleration: float = 50.0
@export var turn_speed: float = 2.0 # rad / s
@export var max_speed: float = 200.0
# @export var max_speed: float 
var direction: float = 0.0 # direction the sprite is facing
var velocity: Vector2 = Vector2.ZERO

var current_shooter: int = 0
var num_shooters: int = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Movement
	if Input.is_action_pressed("move_forward"):
		velocity.x += acceleration * cos(direction) * delta
		velocity.y += acceleration * sin(direction) * delta
	if Input.is_action_pressed("move_backward"):
		velocity.x -= acceleration * cos(direction) * delta
		velocity.y -= acceleration * sin(direction) * delta
	if Input.is_action_pressed("move_left"):
		velocity.x -= acceleration * sin(-direction) * delta
		velocity.y -= acceleration * cos(-direction) * delta
	if Input.is_action_pressed("move_right"):
		velocity.x += acceleration * sin(-direction) * delta
		velocity.y += acceleration * cos(-direction) * delta
	if Input.is_action_pressed("turn_left"):
		direction -= turn_speed * delta
	if Input.is_action_pressed("turn_right"):
		direction += turn_speed * delta
	
	if velocity.length_squared() > max_speed * max_speed:
		velocity = velocity.normalized()
		velocity *= max_speed
	
	position += velocity * delta
	rotation = direction
	
	# Shooting
	if Input.is_action_pressed("primary_shoot"):
		#var bullet = load("res://scenes/bullet.tscn").instance()
		var bullet = Bullet.instantiate()
		bullet.direction = direction
		if current_shooter == 0: 
			bullet.position = $shooter_outer_left.global_position
		else:
			bullet.position = $shooter_outer_right.global_position
		current_shooter = (current_shooter + 1) % num_shooters
		get_parent().add_child(bullet)
