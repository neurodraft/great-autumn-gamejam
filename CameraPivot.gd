extends Spatial

export var rotation_speed : float



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotate_y(rotation_speed * delta)
	if Input.is_action_pressed("ui_left"):
		rotate_y(-rotation_speed * delta)
		
	self.translation = lerp(self.translation, ($"../Player" as Spatial).translation, delta)
	pass
