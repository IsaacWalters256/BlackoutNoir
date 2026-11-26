extends Node2D

var player_inv = []
var partner_inv = []#partner only ever holds stuff you throw him and throws you something when your hand is empty
var current_item = "none"
var current_room = "HazelOffice"
@onready var pauser = get_parent().get_node("Pauser")

var total_moves = []
var driving_locations = []

var moves = 0

func _ready() -> void:
	get_node("Blackout").visible = true

func start(load_data):
	player_input(false)
	if !load_data:
		new_game()

func new_game(t_state=0):
	print("new game")
	if t_state == 0:
		
		var t = pauser.get_tween(self)
		t.tween_property(get_node("Blackout"),"modulate",Color(0,0,0,0),0.5)
		t.tween_callback(self.new_game.bind(1)).set_delay(0.2)
	else:
		update_moves(10)
		player_input(true)



func player_input(now_active):
	print("switch player input")
	if now_active:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		toggle_room_buttons(true)
		#now just waiting for the player to click something
	else:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		toggle_room_buttons(false)

func toggle_room_buttons(now_active):
	print("toggle room buttons")
	pass
	#looks at room, is hazel holding an item
	#are there items around?
	#is the left enemy there? is the right enemy there?

func new_move(button_pressed):
	print("new move")
	toggle_room_buttons(false)
	update_moves(-1)
	#if button id is enemy left
	#what is that enemy? is it a friendly npc that hazel talks with?
	#does he go up and punch that enemy or use his item?
	
	var t = pauser.get_tween(self)
	t.tween_callback(self.moves_check).set_delay(0.2)

func moves_check():
	print("moves left:" + str(moves))
	if moves > 0:
		player_input(true)
	if moves <= 0:
		pass
		#if enemies:
		#enemies_turn()
		#else:
		#	to_driving()

func update_moves(adding_amount):
	moves = moves + adding_amount
	get_node("UI/MovesLabel").text = "Adrenaline: " + str(moves)
	

func enemy_turn():
	print("enemy turn")
	pass

#func _process(delta: float) -> void:
#	pass

func load_room():
	pass

func player_blackout(t_state=0):
	print("blaack out")
	if t_state == 0:
		var t = pauser.get_tween(self)
		t.tween_callback(self.new_game.bind(1)).set_delay(0.2)
	else:
		pass

#func player_death(t_state=0):
	#print("death")
	#if t_state == 0:
		#var t = pauser.get_tween(self)
		#t.tween_callback(self.new_game.bind(1)).set_delay(0.2)
	#else:
		#end_game()

func player_no_clues(t_state=0):
	print("no clues")
	if t_state == 0:
		var t = pauser.get_tween(self)
		t.tween_callback(self.new_game.bind(1)).set_delay(0.2)
	else:
		end_game()

func end_game(t_state=0):
	print("ended")
	if t_state == 0:
		var t = pauser.get_tween(self)
		t.tween_callback(self.new_game.bind(1)).set_delay(0.2)
	else:
		pass


var enemies = {
	"bruiser": {#for the stats and stuff
		
	}
}

var items = {
	
}

#this is also clues basically, kind of just cutscenes and sprites for the driving part?knows the subrooms
#have a been here value so the game doens't hand out the location a second time
var locations = {
	
}

var rooms = {
	"HazelOffice": {
		"BackButton": []#pick random from this array
	}
}
