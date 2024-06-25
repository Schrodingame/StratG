class_name MonopolyPlayer
extends CharacterBody2D
#var result:int
var actCell:int=0
var nextCell:int=0
var money:int=15000
var target_position:Vector2
#var isOnPosition:Signal
signal isOnPosition;
var turnEnded:bool=false
var speedS:int = 600
var selfColor

## Номер игрока. Для корректной работы обязан совпадать с индексом в Global.players[] (индексация с нуля, автоматически пока ничего не определяется).
@export var playerIndex:int =-1
@onready var curcard: CellCard = Global.cells[ 0 ];



func moveToCell(newPos:Vector2):	
	target_position=newPos
	#Global.send_message( "moved to pos " + str( newPos ), 1 )	
	
func _physics_process(_delta):
	var direction = global_position.direction_to(target_position)

	if position.distance_to(target_position)>50:
		velocity = direction*speedS
	else:
		velocity = Vector2.ZERO;
		position = target_position;
		
	move_and_slide()
	if (position.distance_to(target_position)<10):
		emit_signal("isOnPosition")

func _ready():
	
	target_position = Global.cells[0].get_center()
	connect( "isOnPosition", on_position );
	selfColor = Color(randf(),randf(),randf())	 
	$TextureB.self_modulate = selfColor
	$TextureB2.self_modulate = selfColor
	$TextureB3.self_modulate = selfColor
func on_position():
	#print( self, "::on_position() ",  actCell )
	pass

func yourTern(result:int): 	
	for i in range(result,0,-1):
		curcard = curcard.get_next_card();
		moveToCell(curcard.get_center())

		if ( curcard.cellindex == 0 ):
			money += 2000;
			Global.send_message( "+ 2000 == " + str( money ) + " монет у игрока " + str( playerIndex ) );
		
		await isOnPosition	

	curcard.on_player_enter( playerIndex )

	#var bcard: BuildingCard = curcard as BuildingCard;
	#var ecard: EventCard = curcard as EventCard;


	#Добавить таракана
	#добавить хлопок ладошкой по столу/лицу/таракану
	'''if ( actCell < 0 || actCell >= Global.cells.size() ):
		var warningstr = "\"actCell\" (== %d) isn't in the \"Global.cells\" range [%d; %d]." % [ actCell, 0, Global.cells.size() - 1 ];
		push_warning( warningstr );
		print( warningstr );'''
	#else:
