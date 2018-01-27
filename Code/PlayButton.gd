extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var running = false
var spr_play
var spr_stop
var tex
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	tex = get_node("Icon")
	spr_play = tex.texture
	spr_stop = preload("res://Sprites/Stop.png")
	pass

func _input(event):
	if event.is_action_pressed("ui_accept") and  event.is_pressed():
		activated()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func activated():
	running = !running
	if running:
		run()
	else:
		stop()
	pass
	
func run():
	tex.texture = spr_stop
	get_tree().call_group("Cannon", "activate")
	pass

func stop():
	tex.texture = spr_play
	get_tree().call_group("Balls", "queue_free")
	get_tree().call_group("Cannon", "deactivate")
	pass