extends Area2D

var v=700
var pato=null
var c
# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
func _process(delta):
	if pato!=null:
		if (pato.position-position).length()>190:
			var m=(pato.position-position).normalized()
			if m[0] < 0:
				$moves.play("esquerda")
			elif m[0] > 0:
				$moves.play("direita")
			elif m[1] > 0:
				$moves.play("cima")
			elif m[1] < 0:
				$moves.play("baixo")
			position+=m*v*delta
					
func _on_body_entered(body):
	if body.has_method("coletar") and pato==null:
		c = body.coletar(self)
		pato=body.lider
		body.lider=self
