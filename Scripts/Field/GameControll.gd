extends Node2D
var rng = RandomNumberGenerator.new()
var cellsArray = []
var result
var actCell
var players=[]
var actPlayer:int=0

func _ready():
	for child in $".".get_children():
		if child is CharacterBody2D:
			players.append(child)
	print(players)
	$Dice_1_visual.update_value( 1 );
	$Dice_2_visual.update_value( 6 );
	actCell=0
	#$"Player#1".moveToCell(Global.cells[0].global_position)	
	#add_child( MonopolyPlayer.new() ) На будующее для добавления игроков по подключениям


func _on_dice_drop_pressed():
	var dice_1 = $Dice_1_visual.roll();
	var dice_2 = $Dice_2_visual.roll();	
	result = dice_1+dice_2
	if (actCell==5||actCell==15||actCell==25||actCell==35) :
		
		pass
	players[actPlayer].yourTern(result)	
	nextPlayerMove()
	
func nextPlayerMove(): #смена игроков
	if actPlayer+1<players.size():
		actPlayer+=1
	else: actPlayer=0
