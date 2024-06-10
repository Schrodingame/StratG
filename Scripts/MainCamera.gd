extends Camera2D

@onready var origpos: Vector2 = position;
@onready var origzoom: Vector2 = zoom;

var isZoomed: bool;

func handleZoom( e ):
	if ( Input.is_action_just_pressed( "zoom" ) ):
		isZoomed = true;
		zoom = Vector2(3.0, 3.0);

	elif ( Input.is_action_just_released( "zoom" ) ):
		isZoomed = false;
		position = origpos;
		zoom = origzoom;

	if ( isZoomed && e is InputEventMouseMotion ):
		#print( e.position )
		position = e.position;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input( e ):
	handleZoom( e );

