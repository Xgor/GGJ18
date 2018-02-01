extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tree
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	tree = get_tree()
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	pass


func _on_Goal_body_entered( body ):
	tree.call_group("Draw", "drawSplat",position,48)
	
	
	get_tree().call_group("GameManager", "getPoint")
	position.x = rand_range(200,900)
	position.y = rand_range(200,500)
	
	
	pass # replace with function body
