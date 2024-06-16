class_name CellCard
extends Control;

## Внутренний сигнал, который посылается при обновлении @export-переменных (через любой setter).
signal dirtycard;

@export var next_card: CellCard = null;

var cellindex: int = -1; # Also an index in the global array.
#var standingplayers: Array[MonopolyPlayer]; # Don't sure if it is strictly necessary in API, so currently not handled/processed at all.


# === "Virtual" methods ===

func on_player_enter() -> void:
	pass

func on_player_exit() -> bool:
	return true;

func _on_card_update() -> void:
	pass

# Don't forget to call the "super();" in the inherited classes!
func _ready():
	add_to_global_array()
	connect( "dirtycard", _on_card_update );
	emit_signal( "dirtycard" );



# === Internal methods ===

func readywait():
	if not is_node_ready():
		await ready;

func is_parent_in_playfield( testparent: Control ) -> bool:
	return ( testparent && testparent is Control && testparent.name != "Field" );

func auto_find_next_card() -> CellCard:
	var parent = get_parent();
	
	# Ascending in the nodes tree...
	while ( is_parent_in_playfield( parent ) ): parent = parent.get_parent();

	if ( !parent ):
		print( "<", self, ">::auto_find_next_card(). No parent found, returning self." );
		return self; # Not in proper tree.
	
	# Try to find the card next to self in the general tree:
	var allcards: Array[Node] = parent.find_children( "*", "CellCard", true );
	var selfindex = allcards.find( self );

	if ( selfindex == -1 ):
		push_warning( "<", self, ">::auto_find_next_card(). Cannot find self in the tree (id ", selfindex, "), force returning self." );
		return self; # In theory this is an impossible situation, but just in case...

	if ( selfindex >= allcards.size() - 1 ):
		print( "<", self, ">::auto_find_next_card(). Self is the last Card node, returning self." );
		return self; # Stop on self.

	return allcards[ selfindex + 1 ];


func get_center() -> Vector2:
	# Calculate the current real scaling:
	var globalrect = get_global_rect();
	var szscale = globalrect.size / get_rect().size;

	# Calculate the current real rotation:
	var szrotation = 0.0;
	var parent: Control = get_parent();

	while ( is_parent_in_playfield( parent ) && parent.rotation == 0.0 ): parent = parent.get_parent();

	if ( parent ):
		szrotation = parent.rotation;

	# Calculate current real center position:
	return ( globalrect.position + pivot_offset.rotated( szrotation ) * szscale );

func get_next_card() -> CellCard:
	if !next_card:
		next_card = auto_find_next_card();
		print( name, "::get_next_card(). Autoset to ", next_card );

	return next_card;

func add_to_global_array():
	if !visible:
		print( "<", self, ">::add_to_global_array(). Skipped invisible Node." );
	elif get_id() == -1:
		Global.cells.append( self );
		cellindex = Global.cells.size();
	else:
		push_warning( "<", self, ">::add_to_global_array(). Already there (index", get_id(), ")." );

func get_id():
	return cellindex;

