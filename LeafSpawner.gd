extends Spatial

export var maple_leaf : PackedScene
export var num_depth : int
export var num_height : int
export var num_width : int



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for y in num_height:
		for x in num_width:
			for z in num_depth:
				var leaf_instance : Spatial = maple_leaf.instance() as Spatial
				add_child(leaf_instance)
				
			
				leaf_instance.set_translation(Vector3(x, y, z))
				leaf_instance.set_rotation(Vector3(rand_range(0, 360), rand_range(0, 360), rand_range(0, 360)))


	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
