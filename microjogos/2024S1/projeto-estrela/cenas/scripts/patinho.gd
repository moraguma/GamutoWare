extends Area2D

var v=700
var pato=null
var c
# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
func _process(delta):
	if pato!=null:
		if (pato.position-position).length()>200:
			var m=(pato.position-position).normalized()
			position+=m*v*delta
					
func _on_body_entered(body):
	if body.has_method("coletar") and pato==null:
		c = body.coletar(self)
		pato=body.lider
		body.lider=self
