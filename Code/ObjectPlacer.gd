extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var object
var sprite
var active =true
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	sprite = get_node("Sprite")
	pass

func _input(event):
	if event.is_pressed():
		if event.is_action_pressed("mouse_left") and canPlace():
			var o =object.instance()
			get_parent().add_child(o)
			o.position = position
		elif event.is_action_pressed("mouse_right"):
			object = null
			sprite.texture = null
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	position =get_viewport().get_mouse_position()
	
	if canPlace():
		sprite.modulate = Color(0,1,0,0.5)
	else:
		sprite.modulate = Color(1,0,0,0.5)
	pass

func canPlace():
	return position.x < 600 and object != null and get_overlapping_bodies().size() == 0


func selectObject(obj,size):
	sprite.texture =load( "res://Sprites/"+obj+".png")
	object = load( "res://Objects/"+obj+".tscn")
	get_node("CollisionShape2D").shape.radius = size
	pass

func isHoldingSomething():
	return object != null
	
func activate():
	active =true
	show()
	pass
	
func deactivate():
	active = false
	hide()
	#get_tree().call_group("Picker", "selectObject",obj,size)
	pass