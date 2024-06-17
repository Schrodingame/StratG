class_name BuildingCard
extends CellCard;

const DEFAULT_GROUP_COLOR = Color( "FFFFFF00" );

## Название строения.
@export var card_name: String = "?":
	set( val ): card_name = val; emit_signal( "dirtycard" );
## Стоимость строения. Кстати, пока нет платы за аренду...
@export var card_cost: int = 1000:
	set( val ): card_cost = val; emit_signal( "dirtycard" );
## Рисунок на карте. Любая текстура (в т. ч. анимированная), но от уровня карты пока не зависит.
@export var card_picture: Texture2D:
	set( val ): card_picture = val; emit_signal( "dirtycard" );
## Цвет ярлычка группы.
@export var group_color: Color = DEFAULT_GROUP_COLOR:
	set( val ): group_color = val; emit_signal( "dirtycard" );
## Цена улучшений (индекс 0 -- первое улучшение).
@export var card_upgrades_cost: Array[int] = [0, 0, 0, 0]:
	set( val ): card_upgrades_cost = val; emit_signal( "dirtycard" );
## Цена аренды на разных уровнях улучшений.
@export var card_rent: Array[int] = [1000, 0, 0, 0]:
	set( val ): card_rent = val; emit_signal( "dirtycard" );
## Цена аренды на разных уровнях улучшений.
@export var card_upgrade_level: int = 0:
	set( val ): card_upgrade_level = val; emit_signal( "dirtycard" );



@export_group( "Дополнительно" )
## Цвет игрока, в основном для отладочных целей.
@export var player_index:int = -1:
	set( val ): emit_signal( "dirtycard" ); player_index = val;
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

	if ( player_index >= 0 && player_index < Global.players.size() ):
		_cplayercolor.color = Global.players[ player_index ].find_child( "TextureB" ).self_modulate;
	else:
		_cplayercolor.color = "#0F0F0F";

	print("player_index ", player_index, ", color ", _cplayercolor.color, "players.size() ", Global.players.size() )

	_cbackground.color = background_color;
