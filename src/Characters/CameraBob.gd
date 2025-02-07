extends Camera3D

@export var disabled: bool = false
@export var speed: float = 0.1 # Arbitrary number
@export var intensity = .2 # In 3D-space units # (float, 0, 1)

var initial_translation : Vector3
var sine_function = 0
var x = 0

func _ready():
	initial_translation = position

func _process(delta):
	if (Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_S)) and disabled == false:
		x += speed * delta
		sine_function = sin(x)
		position.y = lerp(position.y, initial_translation.y + (sine_function * intensity), 0.1)
	else:
		position.y = lerp(position.y, initial_translation.y, 0.1)
