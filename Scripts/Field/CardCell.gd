class_name BuildingCard
extends CellCard;

@export var cost: int = 12345;
@export var groupcolor: Color = "8888FF";

func _ready():
	print( get_children() );
	
	$"VBoxContainer/Cost".text = str( cost );
	$VBoxContainer/BuildingGroupColor.color = groupcolor;

