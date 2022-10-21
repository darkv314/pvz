extends Node2D

var zombie_generation = RandomNumberGenerator.new()
const zombie_path = preload("res://scenes/characters/CommonZombie.tscn")
const pea_path = preload("res://scenes/plant/attackPlant/peashooter/peashooter.tscn")
const sun_path = preload("res://scenes/plant/sunflower/sunflower.tscn")
const melon_path = preload("res://scenes/plant/attackPlant/melonpult/melonpult.tscn")
var entered_p = false
var entered_s = false
var entered_m = false
var zombieList = []
var cont = 1
onready var loose = $loose
onready var resume = $resume
onready var quit = $quit
onready var play = $play


func _ready():
	loose.hide()
	resume.hide()
	quit.hide()
	play.hide()

#func _unhandled_input(event):
#	if event.is_action_pressed("pause"):
#		resume.show()
#		resume.disabled = false
#		quit.show()
#		quit.disabled = false
#		get_tree().paused = true
	
#func _input(event):

func _process(delta):
	for z in zombieList:
		if (z.is_done_dying):
			zombieList.remove(zombieList.find(z))
		if(z.position.x <= 350):
			print('lose')
			
	if len(zombieList) == 0 and cont == 0:
		print('win')

func _on_ZombieGeneration_timeout():
	zombie_generation = int(rand_range(0, 5))
	if(zombie_generation == 0 and cont != 0):
		var zombie = zombie_path.instance()
		zombie.position = get_node("Zombie1").position
		add_child(zombie)
		zombieList.append(zombie)
		cont -= 1
	if(zombie_generation == 1 and cont != 0):
		var zombie = zombie_path.instance()
		zombie.position = get_node("Zombie2").position
		add_child(zombie)
		zombieList.append(zombie)
		cont -= 1
	if(zombie_generation == 2 and cont != 0):
		var zombie = zombie_path.instance()
		zombie.position = get_node("Zombie3").position
		add_child(zombie)
		zombieList.append(zombie)
		cont -= 1
	if(zombie_generation == 3 and cont != 0):
		var zombie = zombie_path.instance()
		zombie.position = get_node("Zombie4").position
		add_child(zombie)
		zombieList.append(zombie)
		cont -= 1
	if(zombie_generation == 4 and cont != 0):
		var zombie = zombie_path.instance()
		zombie.position = get_node("Zombie5").position
		add_child(zombie)
		zombieList.append(zombie)
		cont -= 1


func _on_resume_button_down():
	print('entro')
	resume.hide()
	quit.hide()
	get_tree().paused = false
	
func _input(event):
	if event.is_action_pressed("plant_move"):
		print('pls')
		if entered_m:
			var melon = melon_path.instance()
			melon.position = get_viewport().get_mouse_position()
			melon.first_click = true
			add_child(melon)
		if entered_p:
			var pea = pea_path.instance()
			pea.position = get_viewport().get_mouse_position()
			pea.first_click = true
			add_child(pea)
		if entered_s:
			var sunf = sun_path.instance()
			sunf.position = get_viewport().get_mouse_position()
			sunf.first_click = true
			add_child(sunf)

func _on_quit_button_down():
	get_tree().quit()


func _on_peashootercard_mouse_entered():
	entered_p = true


func _on_peashootercard_mouse_exited():
	entered_p = false


func _on_sunflowercard_mouse_entered():
	entered_s = true
	
func _on_sunflowercard_mouse_exited():
	entered_s = false


func _on_waterpultcard_mouse_entered():
	entered_m = true


func _on_waterpultcard_mouse_exited():
	entered_m = false
