class_name MonopolyPlayer
extends CharacterBody2D
var target_position = Vector2()
#var result:int
var actCell:int=0
var money:int=15000
var isOnPosition:bool = false

func moveToCell(newPos:Vector2):	
	target_position=newPos
	Global.send_message( "moved to pos " + str( newPos ), 1 )	
	
func _physics_process(_delta):
	var direction = global_position.direction_to(target_position)
	if position.distance_to(target_position)>3:
		velocity = direction*300.0
	else:
		velocity=direction*0
		isOnPosition=true
		#get_Parent().actPlayer
		 # .nextPlayerMove()
	
	move_and_slide()
	
func yourTern(result:int):  
	if (actCell+result)>=39:
		actCell=(actCell+result)-40
		money+=2000
	else : actCell+=result	
	for i in range(actCell,actCell+result):
		isOnPosition=false
		await isOnPosition
		
		
	$"../Money".text=str(money)	
	moveToCell($"..".cellsArray[actCell].global_position)
	#moveToCell()
