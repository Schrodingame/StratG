
extends CharacterBody2D


var target_position = Vector2()



func moveToCell(newPos:Vector2):	
	target_position=newPos
	"""var direction = global_position.direction_to(target_position)
	if position.distance_to(target_position)>3:
		velocity = direction*300.0
	else: velocity=direction*0
	move_and_slide()	"""
	
func _physics_process(delta):
	"""var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 600"""
	var direction = global_position.direction_to(target_position)
	if position.distance_to(target_position)>3:
		velocity = direction*300.0
	else: velocity=direction*0
	
	move_and_slide()
