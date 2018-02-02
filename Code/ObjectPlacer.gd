extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var object
var sprite
var active =false
var pegs = 5
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	sprite = get_node("Sprite")
	#selectObject("peg",12)
	object = get_node("Peg")
	get_node("CollisionShape2D").shape.radius = 12
	pass

func _input(event):
	if (event is InputEventMouseButton):
		#print("Mouse Click/Unclick at: ",event.position)
		#position+= event.relative 
		pass
	elif (event is InputEventMouseMotion):
		#print("Mouse Motion at: ",event.position)
		#print("Mouse Motion at: ",event.relative)
		#position = event.position 
		get_tree().call_group("GameManager", "message",str(position))
		position.x= event.position.x
		position.y= event.position.y 
		#print(position)
	
	if event.is_pressed() and active:
		#and canPlace()
		if event.is_action_pressed("mouse_left") :
			print("hello")
			var o =object.duplicate()
			o.show()
			get_parent().add_child(o)
			o.position = position
			get_tree().call_group("GameManager", "activated")
			get_tree().call_group("Tutorial", "hide")
			get_node("PlaceSound").play()
	
	
	#	elif event.is_action_pressed("mouse_right"):
	#		object = null
	#		sprite.texture = null
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#position =get_global_mouse_position()
	if active:
		if canPlace():
			#sprite.show()
		
		##	sprite.modulate = Color(0,1,0,0.5)
			pass
		else:
			#sprite.hide()
		
	#	sprite.modulate = Color(1,0,0,0.5)
			pass
	pass

func canPlace():
	#position.x < 780 and position.x > 100 and
	return position.x > 150 and object != null and get_overlapping_bodies().size() == 0


func selectObject(obj,size):
	#sprite.texture =load( "res://Sprites/"+obj+".png")
	object = load( "res://Objects/"+obj+".tscn")
	get_node("CollisionShape2D").shape.radius = size
	pass

func isHoldingSomething():
	return object != null
	
func activate():
	active =true
	sprite.show()
	pass
	
func deactivate():
	active = false
	sprite.hide()
	#get_tree().call_group("Picker", "selectObject",obj,size)
	pass
	

