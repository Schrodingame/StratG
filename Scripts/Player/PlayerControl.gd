
extends CharacterBody2D


var target_position = Vector2()



func moveToCell(newPos:Vector2):	
	target_position=newPos
	Global.send_message( "moved to pos " + str( newPos ), 1 )
	"""var direction = global_position.direction_to(target_position)
	if position.distance_to(target_position)>3:
		velocity = direction*300.0
	else: velocity=direction*0
	move_and_slide()	"""
	
func _physics_process(_delta):
	var direction = global_position.direction_to(target_position)
	if position.distance_to(target_position)>3:
		velocity = direction*300.0
	else: velocity=direction*0
	
	move_and_slide()
