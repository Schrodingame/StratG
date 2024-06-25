extends Node2D
#var rng = RandomNumberGenerator.new()
var cellsArray = []
var result
var actCell
#var players=[]
var actPlayer:int=0

func _ready():
	for child in $".".get_children():
		if child is CharacterBody2D:
			Global.players.append(child)
			child.playerIndex = Global.players.size() - 1;
	print(Global.players)
	$Dice_1_visual.update_value( 1 );
	$Dice_2_visual.update_value( 6 );
	actCell=0
	#$Player_1_money.self_modulate(Global.players[0].)
	#$"Player#1".moveToCell(Global.cells[0].global_position)	
	#add_child( MonopolyPlayer.new() ) На будующее для добавления игроков по подключениям
func _physics_process(_delta):
	$Player_1_money.text = str("P1  = ",Global.players[0].money)	
	$Player_2_money.text = str("P2  = ",Global.players[1].money)

func _on_dice_drop_pressed():
	var dice_1 = $Dice_1_visual.roll();
	var dice_2 = $Dice_2_visual.roll();	
	result = dice_1+dice_2
	
	Global.players[actPlayer].yourTern(result)	
	nextPlayerMove()
	
func nextPlayerMove(): #смена игроков
	if actPlayer+1<Global.players.size():
		actPlayer+=1
	else: actPlayer=0

