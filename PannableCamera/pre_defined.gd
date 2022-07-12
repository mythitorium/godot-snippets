extends Camera2D

var index = 0

# 50%, 75%, 100%, and 125% zoom respectively 
var zooms = [2,1.33,1,0.66]

var fixed_toggle_point = Vector2(0,0)
var pan_camera = false

# Feature that can prevent the camera's position from exeeding these values
# Good for preventing the camera from going "out of bounds"
export var obey_bounds = false
export var bounds_lower = Vector2(-1000,-1000)
export var bounds_upper = Vector2(1000,1000)


func _ready():
	# Prevents zooming order from being whack
	zooms.sort()


func _process(_delta):
		if pan_camera:  move_map_around()


# Moves the map around just like in the editor
func move_map_around():
	var ref = get_viewport().get_mouse_position()
	self.global_position.x -= (ref.x - fixed_toggle_point.x)*zooms[index]
	self.global_position.y -= (ref.y - fixed_toggle_point.y)*zooms[index]
	fixed_toggle_point = ref
	
	if obey_bounds:
		global_position.x = clamp(global_position.x,bounds_lower.x,bounds_upper.x)
		global_position.y = clamp(global_position.y,bounds_lower.y,bounds_upper.y)


# Input
func _unhandled_input(event):
	if event is InputEventMouseButton:
		# Camera panning
		if event.button_index == BUTTON_MIDDLE:
			if event.pressed:
				var ref = get_viewport().get_mouse_position()
				fixed_toggle_point = ref
				pan_camera = true
			else:
				pan_camera = false
		# Camera Zooming
		if event.button_index == BUTTON_WHEEL_UP and event.pressed: index -= 1
		if event.button_index == BUTTON_WHEEL_DOWN and event.pressed: index += 1
		index = clamp(index,0,zooms.size()-1)
		zoom = Vector2(zooms[index],zooms[index])
