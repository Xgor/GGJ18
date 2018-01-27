extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var trail
func _ready():
	# Called every time the node is added to the scene.
	# Initial
	#add_force(Vector2(0,0), Vector2(0,1)*400)
	trail =load( "res://Objects/trail.tscn")
	pass

func fire(rot,firePower):
	var angle = Vector2(cos(rot), sin(rot))
	set_axis_velocity(angle*firePower)
	#add_force(Vector2(0,0), angle*400)
	
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
   
	pass
   



func _on_Ball_body_entered( body ):
	##if body.name == "Bumper":
	for group in body.get_groups ():
		if group == "Bumper":
			var angle = position-body.position
			angle =angle.normalized()
			print(angle)
			linear_velocity = angle*500
			#set_axis_velocity(angle*10)
	
	pass # replace with function body


func _on_Ball_body_shape_entered( body_id, body, body_shape, local_shape ):

	pass # replace with function body


func _on_Timer_timeout():
	var o = trail.instance()
	get_parent().call_deferred("add_child",o)
	o.position = position
	pass # replace with function body
