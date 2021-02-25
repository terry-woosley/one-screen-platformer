extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 250
const FRICTION = 1000
const GRAVITY = 700
const JUMP = 250

var velocity = Vector2.ZERO
var screensize

# Called when the node enters the scene tree for the first time.
func _ready():
	 screensize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_pressed("ui_right"):
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCELERATION * delta)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -JUMP

func _physics_process(delta):
	#falling
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)