extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var running = false
var pegs = 6
var score = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	run()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
	pass

func activated():
	running = !running
	if running:
		run()
	else:
		stop()
	pass

func updateText():
	get_node("Score").text = "Score " + str(score)
	get_node("Pegs").text = "Pegs " + str(pegs)

func message(stn):
	get_node("Test").text = stn
#	g.test = str
	pass

func run():
#	tex.texture = spr_stop
	get_tree().call_group("Cannon", "activate")
	get_tree().call_group("Trail", "queue_free")
	get_tree().call_group("Picker", "deactivate")
	running = true
	pegs -= 1
	updateText()
	pass

func getPoint():
	score += 1
	if pegs > 7:
		pegs += 1
	elif pegs > 3:
		pegs += 2
	else:
		pegs += 3
	stop()
	get_tree().call_group("Cannon", "move")
	run()
	running = false

func stop():
#	tex.texture = spr_play
	get_tree().call_group("Balls", "queue_free")
	get_tree().call_group("Trail", "show")
	get_tree().call_group("Cannon", "deactivate")
	
	get_tree().call_group("Picker", "activate")
	
	running = false
	updateText()
	if pegs == 0:
		loseGame()
	pass
	

func loseGame():
	get_node("Game Over").show()
	get_node("Timer").start()
	pass

func _on_Timer_timeout():
	get_tree().reload_current_scene()
	pass # replace with function body
