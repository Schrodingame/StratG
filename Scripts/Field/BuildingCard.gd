class_name BuildingCard
extends CellCard;

const DEFAULT_GROUP_COLOR = Color( "FFFFFF00" );

## Название строения.
@export var card_name: String = "?":
	set( val ): emit_signal( "dirtycard" ); card_name = val;
## Стоимость строения. Кстати, пока нет платы за аренду...
@export var card_cost: int = 1000:
	set( val ): emit_signal( "dirtycard" ); card_cost = val;
## Рисунок на карте. Любая текстура (в т. ч. анимированная), но от уровня карты пока не зависит.
@export var card_picture: Texture2D:
	set( val ): emit_signal( "dirtycard" ); card_picture = val;
## Цвет ярлычка группы.
@export var group_color: Color = DEFAULT_GROUP_COLOR:
	set( val ): group_color = val; emit_signal( "dirtycard" );


@export_group( "Дополнительно" )
## Цвет игрока, в основном для отладочных целей.
@export var player_color: Color = "#0505055f":
	set( val ): emit_signal( "dirtycard" ); player_color = val;
## Цвет фоновой подложки.
@export var background_color: Color = "#0000005f":
	set( val ): emit_signal( "dirtycard" ); background_color = val;

@onready var _cbackground = $Background;
@onready var _cname = $VBoxContainer/Name;
@onready var _ccost = $VBoxContainer/PlayerColor/Cost;
@onready var _cpicture = $VBoxContainer/PlayerColor/AspectRatioContainer/Picture;
@onready var _cgroupcolor = $VBoxContainer/Name/GroupColor;
@onready var _cplayercolor = $VBoxContainer/PlayerColor;


#func set_card_name( val: String ): _cname.text = val;
#func set_card_cost( val: int ): _ccost.text = str( val );
#func set_card_picture( val: Texture2D ): _cpicture.texture = val;


func _ready():
	super();
	#print( get_children() );

	if ( group_color == DEFAULT_GROUP_COLOR ):
		var parent = get_parent();
		if ( parent ):
			var siblings = parent.find_children( "*", "BuildingCard", true );
			# The first BuildingCard sibling will always exist (at least it fallbacks to self).
			group_color = siblings[ 0 ].group_color;
# of func _ready()


func _on_card_update():
	#print( "on_card_update() for ", self );

	_cname.text = card_name;
	_ccost.text = str( card_cost ) + "$";
	_cgroupcolor.color = group_color;
	_cpicture.texture = card_picture;
	_cplayercolor.color = player_color;
	_cbackground.color = background_color;
