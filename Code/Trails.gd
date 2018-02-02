extends Node2D

var p
var s
var c = Color()

var splat = 0

func _ready():
	p =Vector2()
	s = 0
	

func _draw():
	var rand = Vector2()
	if splat:
		#newTrail()
		c.s = 0.5
		draw_circle(p,s,c)
		for i in range(20):
			rand.x = rand_range(-1,1)
			rand.y = rand_range(-1,1)
			rand =rand.normalized()
			rand = rand *s
			draw_circle(p+rand,rand_range(2,s/8),c)
		c.s = 0.3
	else:
		draw_circle(p,s,c)
		for i in range(10):
			rand.x = rand_range(-1,1)
			rand.y = rand_range(-1,1)
			rand =rand.normalized()
			rand = rand *s
			draw_circle(p+rand,rand_range(2,s/8),c)
		#draw_circle(p,s,c)
	#var rand = Vector2()
	splat = false

func _process(delta):
	
	pass

func getCol():
	return c

func drawTrail(pos,trailSize):
	#draw_circle(pos,trailSize,Color(255,0,0))
	p = pos
	s = trailSize
	
	update()

func newTrail(): 
  c.v = 1 
  c.s = 0.3 
  c.h += 0.29

func drawSplat(pos,trailSize):
	p = pos
	s = trailSize
	splat = 20
	update()