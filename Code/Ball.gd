extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var TweenNode = get_node("Tween")
var trail
var s
onready var tree =get_tree()
func _ready():
	# Called every time the node is added to the scene.
	# Initial
	#add_force(Vector2(0,0), Vector2(0,1)*400)
	trail =load( "res://Objects/trail.tscn")
	s = Vector2(1,1)
	TweenNode.interpolate_property(self, "s", Vector2(1, 1), Vector2(0.0, 0.0), 20,Tween.TRANS_LINEAR,Tween.EASE_IN)
	TweenNode.start()
	pass

func fire(rot,firePower):
	var angle = Vector2(cos(rot), sin(rot))
	set_axis_velocity(angle*firePower)
	#add_force(Vector2(0,0), angle*400)
	#modulate = get_node(".../Trail/TrailViewport/DrawTrail").getCol()
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	scale = s
	get_node("CollisionShape2D").scale = s
	#s = scale
	if position.y > 1000 or s.x ==0:
		tree.call_group("GameManager", "stop")
	pass
   



func _on_Ball_body_entered( body ):
	get_node("BounceSound").play()
	##if body.name == "Bumper":
	
	#for group in body.get_groups ():
		#if group == "Pegs":
			#body.removeDurability()
	
	pass # replace with function body


func _on_Ball_body_shape_entered( body_id, body, body_shape, local_shape ):

	pass # replace with function body


func _on_Timer_timeout():
	tree.call_group("Draw", "drawTrail",position,32*(20-TweenNode.tell())/20)
	
	#var o = get_node("Trail").duplicate()
	
	#o.position = position
	#o.scale = Vector2(0.5,0.5)
	#get_parent().call_deferred("add_child",o)
	pass # replace with function body

func drawSplat():
	tree.call_group("Draw", "drawSplat",position,48)

func _on_Tween_tween_completed( object, key ):
	#TweenNode.stop()
	pass # replace with function body
