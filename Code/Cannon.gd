extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var object 
export var firePower= 400

func _ready():
	object = preload( "res://Objects/Ball.tscn")
	# Called every time the node is added to the scene.
	# Initialization here
	#fire()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func move():
	position.y= rand_range(300,500)
	pass

func activate():
	fire()
	pass

func deativate():
	
	pass

func fire():
	var o =object.instance()
	
	$Sound.play()
	get_tree().root.call_deferred("add_child",o)
	o.position = get_node("FirePos").global_position
	
	o.fire(rotation,firePower)
	get_tree().call_group("Draw", "newTrail")
	
	pass