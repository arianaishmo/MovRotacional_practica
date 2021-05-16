extends Node2D


onready var img = get_node("ruleta")
var rotate
var t
var r 

# Se inicializan las variables de t (tiempo) y rotate (tetha)
# La variable r nos sevirá como indicador de que la ruleta tiene que parar.
func _ready():
	self.set_process(true)
	rotate = 0
	t = 0
	r = true


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if r == true:
		# Ecuación de tetha respecto al tiempo expreseada en la práctica
		rotate = -1 - 0.6 * t + 0.25 * t * t
		img.rotate(deg2rad(rotate))
		
		# Se depliega el tiempo y tetha en unas etiquetas de la pantalla principal
		$RichTextLabel.text += "\n" + str(t)
		$RichTextLabel2.text += "\n" + str(rotate)
	else:
		rotate = 0
	
	# Indicador de que la ruleta debe parar a los 10 segundos (modificable)
	if t > 10:
		r = false
	
	#Acumulador del tiempo
	t += delta
	
