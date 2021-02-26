extends KinematicBody2D

const ACCELERATION = 750
const MAX_SPEED = 250
const FRICTION = 2000
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
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCELERATION * delta)
		$Sprite.flip_h = true
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -JUMP

func _physics_process(delta):
	#falling
	velocity.y += GRAVITY * delta
	if is_on_floor():
		velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP, true)
	else:
		velocity = move_and_slide_with_snap(velocity, Vector2.ZERO, Vector2.UP, true)

	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
