extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var entered = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("plant_move") and entered:
		self.queue_free()
		

func _on_KinematicBody2D_mouse_entered():
	print('lol')
	entered = true


func _on_KinematicBody2D_mouse_exited():
	entered = false
