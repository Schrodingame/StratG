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
var playerIndex:int =-1
var selfColor
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
	var selfColor = Color(randf(),randf(),randf())	 
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
	
	var bcard: BuildingCard = curcard as BuildingCard;
	var ecard: EventCard = curcard as EventCard;
	
	if ( bcard ):		
		if bcard.player_index<=-1:
			$"../BuyWindow".show()
			$"../BuyWindow"._labelText.text = str(bcard.card_cost)
			await $"../BuyWindow".choused
			if  $"../BuyWindow".buy:
				bcard.player_index =  playerIndex 
				print ("this is bcard player index = ", bcard.player_index)
				bcard._on_card_update()
				money-=bcard.card_cost;
				
				Global.send_message( "Осталось " + str( money ) + " монет у игрока " + str( playerIndex ) );
			else :return null
		elif ( bcard.player_index != playerIndex ):
			money-=bcard.card_rent[ bcard.card_upgrade_level ];
			Global.players[bcard.player_index].money+=bcard.card_rent[ bcard.card_upgrade_level ]
			Global.send_message( "Попал на поле игрока " + str( bcard.player_index ) + ". Осталось " + str( money ) + " монет у игрока " + str( playerIndex ) );
	if (ecard):
		var randomCard = ecard.encounter[(randi_range(0,2))]
		$"../EventWindow".show()
		$"../EventWindow"._eventText.text = str(randomCard[0])  #Взять текст события
		money+=randomCard[1]
		if randomCard[2]!=null:			
			curcard = Global.cells[randomCard[2]-1]
			yourTern(1)
		await $"../EventWindow".accepted
		
		ecard.encounter
		return 0
	#Добавить таракана
	#добавить хлопок ладошкой по столу/лицу/таракану
	'''if ( actCell < 0 || actCell >= Global.cells.size() ):
		var warningstr = "\"actCell\" (== %d) isn't in the \"Global.cells\" range [%d; %d]." % [ actCell, 0, Global.cells.size() - 1 ];
		push_warning( warningstr );
		print( warningstr );'''
	#else:
		

