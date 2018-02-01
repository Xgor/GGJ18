extends Node2D

var p
var s
var c = Color()
var splat = false

func _ready():
	p =Vector2()
	s = 0

func _draw():
	if splat:
		#newTrail()
		c.s = 0.5
		draw_circle(p,s/1.5,c)
		var rand = Vector2()
		for i in range(7):
			rand.x = rand_range(-1,1)
			rand.y = rand_range(-1,1)
			rand =rand.normalized()
			rand = rand *s
			draw_circle(p+rand,s/2,c)
			var rand2 = Vector2()
			for i in range(5):
				rand2.x = rand_range(-1,1)
				rand2.y = rand_range(-1,1)
				rand2 = rand2.normalized()
				rand2 = rand2 *s/1.5
				draw_circle(p+rand+rand2,s/4,c)
				pass
		c.s = 0.3
	else:
		draw_circle(p,s,c)
	splat = false
#	print(p)
	var rand = Vector2()

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
  c.h = rand_range(0,1)

func drawSplat(pos,trailSize):
	p = pos
	s = trailSize
	splat =true
	update()