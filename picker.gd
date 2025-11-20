extends Control

const CLASSES = {
	'warrior': {
		'races' : [
			'human',
			'dwarf',
			'orc',
			'troll',
			'gnome',
			'nightelf',
			'undead',
			'tauren'
		],
		'specs': ['protection', 'arms', 'fury']
	},
	'paladin': {
		'races' : ['human', 'dwarf'],
		'specs': ['protection', 'holy', 'retribution']
	},
	'rogue': {
		'races' : ['human', 'dwarf', 'orc', 'troll', 'gnome', 'nightelf', 'undead'],
		'specs': ['assassination', 'combat', 'subtlety']
	},
	'priest': {
		'races' : ['human', 'dwarf', 'troll', 'nightelf', 'undead'],
		'specs': ['Discipline', 'Holy', 'Shadow']
	},
	'mage': {
		'races' : ['human', 'troll', 'gnome', 'undead'],
		'specs': ['Arcane', 'Fire', 'Frost']
	},
	'warlock': {
		'races' : ['human', 'orc', 'gnome', 'undead'],
		'specs': ['Demonology', 'Affliction', 'Destruction']
	},
	'hunter': {
		'races' : ['dwarf', 'orc', 'troll', 'nightelf', 'tauren'],
		'specs': ['Beast Master', 'Survival', 'Marksmanship']
	},
	'druid': {
		'races' : ['nightelf', 'tauren'],
		'specs': ['Restoration', 'Balance', 'Feral Combat']
	},
	'shaman': {
		'races' : ['orc', 'troll', 'tauren'],
		'specs': ['Restoration', 'Elemental', 'Enhancement']
	}
}


func _ready() -> void:
	$Label.text = getRandomCharacter()


func getRandomDictItem(dict: Dictionary, returnKey = false):
	var keys = dict.keys() 
	var random_index = randi() % dict.size() 
	
	if returnKey:
		return [dict[keys[random_index]], keys[random_index]]
	
	return dict[keys[random_index]] 


func getRandomCharacter():
	var gender = ['male', 'female'].pick_random()
	var randomClass: String = getRandomDictItem(CLASSES, true)[1]
	var race: String = CLASSES[randomClass]['races'].pick_random()
	var spec: String = CLASSES[randomClass]['specs'].pick_random()
	
	return gender + ' ' + race + ' ' + spec + ' ' + randomClass


func _on_button_button_down() -> void:
	$Label.text = getRandomCharacter()
