extends Node2D

var p
var s
var c = Color()
func _ready():
	p =Vector2()
	s = 0

func _draw():
	draw_circle(p,s,c)
#	print(p)

func drawTrail(pos,trailSize):
	#draw_circle(pos,trailSize,Color(255,0,0))
	p = pos
	s = trailSize
	update()

func newTrail():
	c.v = 1
	c.s = 0.3
	c.h = rand_range(0,1)