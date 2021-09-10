extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var radius : float
export var max_repulsion : float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	print(bodies)
	for body in bodies:
		var distance_vector : Vector3 = (self as Spatial).global_transform.origin - (body as Spatial).global_transform.origin

		var direction = distance_vector.normalized()
		var magnitude = distance_vector.length()
		var repulsion_factor = (radius - magnitude) / radius
		var impulse = direction * max_repulsion * repulsion_factor
		#print(force)
		(body as RigidBody).apply_central_impulse(impulse)
	pass

