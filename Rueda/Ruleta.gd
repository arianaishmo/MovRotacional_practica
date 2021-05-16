extends Node2D


onready var img = get_node("ruleta")
var rotate
var t
var r 

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_process(true)
	rotate = 0
	t = 0
	r = true


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if r == true:
		rotate = -1 - 0.6 * t + 0.25 * t * t
		img.rotate(deg2rad(rotate))
		$RichTextLabel.text += "\n" + str(t)
		$RichTextLabel2.text += "\n" + str(rotate)
	else:
		rotate = 0
	
	
	if t > 10:
		r = false

	t += delta
	
