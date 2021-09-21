extends KinematicBody

# Member variables
var g = -9.8
var vel = Vector3()
const MAX_SPEED = 5
const JUMP_SPEED = 7
const ACCEL= 2
const DEACCEL= 4
const MAX_SLOPE_ANGLE = 30


func _physics_process(delta):
	var dir = Vector3() # Where does the player intend to walk to
	var cam_xform = get_viewport().get_camera().get_global_transform()
	
	if (Input.is_action_pressed("move_forward")):
		dir += -cam_xform.basis[2]
	if (Input.is_action_pressed("move_backwards")):
		dir += cam_xform.basis[2]
	if (Input.is_action_pressed("move_left")):
		dir += -cam_xform.basis[0]
	if (Input.is_action_pressed("move_right")):
		dir += cam_xform.basis[0]
		
	var cam = get_viewport().get_camera()
	var mouse_pos = get_viewport().get_mouse_position()
	
	var ray_origin = cam.project_ray_origin(mouse_pos)
	var ray_normal = cam.project_ray_normal(mouse_pos)
	
	$RayCast.global_transform.origin = ray_origin
	$RayCast.set_cast_to(ray_normal * 50)
	
	#$Raycast.force_raycast_update()
	
	if $RayCast.is_colliding():
		var collision_point = $RayCast.get_collision_point()
		
		self.look_at(Vector3(collision_point.x, self.translation.y, collision_point.z), Vector3.UP)
		#var distance = ray_origin.distance_to(collision_point)




#	(self as Spatial).look_at(direction)

#	if (Input.is_action_pressed("rotate_right")):
#		(self as Spatial).rotate_y(-5 * delta)
#	if (Input.is_action_pressed("rotate_left")):
#		(self as Spatial).rotate_y(5 * delta)
	
	dir.y = 0
	dir = dir.normalized()
	
	#vel.y += delta*g
	
	var hvel = vel
	hvel.y = 0
	
	var target = dir*MAX_SPEED
	var accel
	if (dir.dot(hvel) > 0):
		accel = ACCEL
	else:
		accel = DEACCEL
	
	hvel = hvel.linear_interpolate(target, accel*delta)
	
	vel.x = hvel.x
	vel.z = hvel.z
	
	var motion = move_and_slide(vel)
