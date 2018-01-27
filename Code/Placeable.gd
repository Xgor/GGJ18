extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var placer

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("GrabShape").shape = get_parent().get_node("CollisionShape2D").shape
	placer =get_tree().root.find_node("ObjectPlacer",true,false)
	pass


func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	pass


func _on_Placeable_input_event( viewport, event, shape_idx ):
	
	if event.is_pressed():
		
		if event.is_action_pressed("mouse_right"):
			#print("ello")
			get_parent().queue_free()
#			queue_free()
	pass 

