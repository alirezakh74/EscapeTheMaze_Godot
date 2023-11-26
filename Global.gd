extends Node

var levels = ['res://_scenes/levels/Level1.tscn']
#,'res://_scenes/levels/Level2.tscn']

var current_level

var start_screen = 'res://_scenes/screens/StartScreen.tscn'
var end_screen = 'res://_scenes/screens/EndScreen.tscn'

var score

var highscore
var score_file = "user://hightscore.txt"


func _ready():
	setup()


func setup():
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		highscore = int(content)
		f.close()
	else:
		highscore = 0


func new_game():
	current_level = -1
	score = 0
	next_level()


func game_over():
	if score > highscore:
		highscore = score
	save_score()
	get_tree().change_scene(end_screen)


func save_score():
	var f = File.new()
	f.open(score_file, File.WRITE)
	f.store_string(str(highscore))
	f.close()


func next_level():
	current_level += 1
	if current_level >= Global.levels.size():
		game_over() # no more levels to load
	else:
		get_tree().change_scene(levels[current_level])

func cast_to_persian_number(value : int):
	var finalStr : String = ""
	var myStr : String = str(value)
	var myChars : Array = []
	for c in myStr:
		myChars.push_back(c)
	for mychar in myChars:
		if mychar == "0":
			finalStr += "٠"
		if mychar == "1":
			finalStr += "١"
		if mychar == "2":
			finalStr += "٢"
		if mychar == "3":
			finalStr += "٣"
		if mychar == "4":
			finalStr += "۴"
		if mychar == "5":
			finalStr += "٥"
		if mychar == "6":
			finalStr += "٦"
		if mychar == "7":
			finalStr += "٧"
		if mychar == "8":
			finalStr += "٨"
		if mychar == "9":
			finalStr += "٩"
	#print(finalStr)
	return finalStr


