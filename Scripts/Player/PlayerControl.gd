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

	if position.distance_to(target_position)>5:
		velocity = direction*600.0
	else:
		velocity = Vector2.ZERO;
		position = target_position;
		isOnPosition=true
	move_and_slide()
	
func yourTern(result:int):  
	if (actCell+result)>Global.cells.size():
		actCell=(actCell+result)-Global.cells.size()
		money+=2000
	else : actCell+=result	
	for i in range(actCell,actCell+result):
		isOnPosition=false
		await isOnPosition
		print(i)
	$"../Money".text=str(money)	
	
	if ( actCell < 0 || actCell >= Global.cells.size() ):
		var warningstr = "\"actCell\" (== %d) isn't in the \"Global.cells\" range [%d; %d]." % [ actCell, 0, Global.cells.size() - 1 ];
		push_warning( warningstr );
		print( warningstr );
	else:
		moveToCell(Global.cells[actCell].get_center())

