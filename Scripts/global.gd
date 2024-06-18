extends Node;

var cells: Array[CellCard];
var players: Array[MonopolyPlayer];

@onready var messagebox: Control;

func _ready():
	if ( get_node_or_null( "/root/Game/MessageBoxContainer" ) ):
		messagebox = $"/root/Game/MessageBoxContainer".find_child( "MessageBox" );
		
func send_message( msg: String, playernum: int = -1 ):
	if ( messagebox ):
		messagebox.add_message( msg, playernum )
	else:
		push_warning( "Global.send_message(). No MessageBox." );
		print_stack();


