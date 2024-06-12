class_name BuildingCard
extends Control;

@export var card_name: String = "?":
	set( val ): await readywait(); _cname.text = val;
@export var card_cost: int = 1000:
	set( val ): await readywait(); _ccost.text = str( val ) + "$";
@export var card_picture: Texture2D:
	set( val ): await readywait(); _cpicture.texture = val;
@export var group_color: Color = "004015":
	set( val ): await readywait(); _cgroupcolor.color = val;

@export_group( "Extra" )
@export var player_color: Color = "000000";
@export var background_color: Color = "#0000005f";

@onready var _cbackground = $Background;
@onready var _cname = $VBoxContainer/Name;
@onready var _ccost = $VBoxContainer/PlayerColor/Cost;
@onready var _cpicture = $VBoxContainer/PlayerColor/AspectRatioContainer/Picture;
@onready var _cgroupcolor = $VBoxContainer/Name/GroupColor;
@onready var _cplayercolor = $VBoxContainer/PlayerColor;


func set_card_name( val: String ): _cname.text = val;
func set_card_cost( val: int ): _ccost.text = str( val );
func set_card_picture( val: Texture2D ): _cpicture.texture = val;

func readywait():
	if not is_node_ready():
		await ready;

func _ready():
	print( get_children() );

	# Force updating the @exported values:
	card_name = card_name;
	card_cost = card_cost;
	card_picture = card_picture;
	group_color = group_color;

#	$"VBoxContainer/Cost".text = str( cost );
#	$VBoxContainer/BuildingGroupColor.color = groupcolor;

