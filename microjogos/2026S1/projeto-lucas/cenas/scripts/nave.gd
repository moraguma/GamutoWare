extends CharacterBody2D

const PROPULSION = 200
const ANGULAR_VELOCITY = PI/1.5

var lua
var bandeira
func _ready() -> void:
	lua = get_node("../Lua")
	bandeira = get_node("../Bandeira")
	
	# Áudio da nave
	$AudioPropulsao.play()
	$AudioPropulsao.stream_paused = true
	
	# Define distância ao centro da lua e variação em relação ao eixo x
	var initialPosition = randfn(600, 50)
	var initialPositionAngle = randf_range(-PI/5, PI/5)
	# Define lado em que nave spawna (side=0 -> direita, side=1 -> esquerda)
	var side = randi()%2
	var displacement = Vector2.RIGHT.rotated(initialPositionAngle+(PI*side))*initialPosition
	set_position(lua.position+displacement)
	
	# Define vetor velocidade inicial
	var initialVelocity = randfn(0.5, 0.3)*200
	var initialVelocityAngle = randfn(initialPositionAngle+PI, PI/5)
	velocity = Vector2.UP.rotated(initialVelocityAngle)*initialVelocity


var end: bool = false
func _physics_process(delta: float) -> void:
	if not end:
		var acceleration = find_acceleration()
		velocity += acceleration*delta
		
		# Rotação varia com setinhas
		var angleDirection = Input.get_axis("esquerda", "direita")
		rotation += angleDirection*ANGULAR_VELOCITY*delta

	if move_and_collide(velocity*delta) and not end:
		end = true
		$AudioPropulsao.stream_paused = true
		$Trail.emitting = false
		
		if velocity.length()<305:
			Minigames.register_win(self)
			win_explosion()
		else: lose_explosion()


func find_acceleration() -> Vector2:
	# Define aceleração = propulsão + gravidade
	var acceleration: Vector2 = gravityAcceleration()
	if Input.is_action_pressed("acao"):
		acceleration += Vector2.UP.rotated(rotation)*PROPULSION
		
		# Animação e som
		$Sprite2D/AnimationPlayer.play("acelerado")
		$AudioPropulsao.stream_paused = false
		
		$Trail.gravity = Vector2.UP.rotated(-rotation)
		$Trail.emitting = true
	else:
		# Animação e som
		$Sprite2D/AnimationPlayer.play("parado")
		$AudioPropulsao.stream_paused = true
		$Trail.emitting = false
		
	return acceleration


func gravityAcceleration() -> Vector2:
	var directionVec: Vector2 = lua.position-position
	var normalizedVec: Vector2 = directionVec.normalized()
	
	var acceleration = (10**6.7)*normalizedVec/(directionVec.length_squared()-6767)
	
	return acceleration


func lose_explosion() -> void:
	$Sprite2D.visible = false
	
	# Explosion particles
	$ExplosionParticles.rotation = -rotation
	$ExplosionParticles.direction = velocity.normalized()
	$ExplosionParticles.emitting = true
	
	# Explosion animation
	$ExplosionSprite.rotation = velocity.angle()-rotation+PI/2
	$ExplosionSprite.visible = true
	$ExplosionSprite/AnimationPlayer.play("explodir")
	
	$AudioExplosao.play()


func win_explosion() -> void:
	# Ajusta a posição da nave
	var luaNave: Vector2 = position-lua.position
	rotation = luaNave.angle()+PI/2
	
	# Bandeira
	var posBandeira = lua.position+luaNave.rotated(PI/11)
	bandeira.position = posBandeira
	bandeira.rotation = (posBandeira-lua.position).angle()+PI/2
	bandeira.get_node("AnimationPlayer").play("balangar")
	
	$Sprite2D/AnimationPlayer.play("win_rotation")
