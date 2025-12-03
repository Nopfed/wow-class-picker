extends Control

# TODO -> Add the ability to roll individual parts of the caracter separately
# TODO -> Add professions

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
		'specs': ['protection', 'arms', 'fury'],
		'weapons': [
			'One-Handed Axe',
			'One-Handed Sword',
			'One-Handed Mace',
			'Two-Handed Axe',
			'Two-Handed Sword',
			'Two-Handed Mace',
			'Dagger',
			'Polearm',
			'Staff',
			'Fist Weapon'
		]
	},
	'paladin': {
		'races' : ['human', 'dwarf'],
		'specs': ['protection', 'holy', 'retribution'],
		'weapons': [
			'One-Handed Axe',
			'One-Handed Sword',
			'One-Handed Mace',
			'Two-Handed Axe',
			'Two-Handed Sword',
			'Two-Handed Mace',
			'Polearm'
		]
	},
	'rogue': {
		'races' : [
			'human', 'dwarf', 'orc', 'troll', 'gnome', 'nightelf', 'undead'
		],
		'specs': ['assassination', 'combat', 'subtlety'],
		'weapons': [
			'One-Handed Sword',
			'One-Handed Mace',
			'Dagger',
			'Fist Weapon'
		]
	},
	'priest': {
		'races' : ['human', 'dwarf', 'troll', 'nightelf', 'undead'],
		'specs': ['Discipline', 'Holy', 'Shadow'],
		'weapons': [
			'One-Handed Mace',
			'Dagger',
			'Staff',
			'Wand'
		]
	},
	'mage': {
		'races' : ['human', 'troll', 'gnome', 'undead'],
		'specs': ['Arcane', 'Fire', 'Frost'],
		'weapons': [
			'One-Handed Sword',
			'Dagger',
			'Staff',
			'Wand'
		]
	},
	'warlock': {
		'races' : ['human', 'orc', 'gnome', 'undead'],
		'specs': ['Demonology', 'Affliction', 'Destruction'],
		'weapons': [
			'One-Handed Sword',
			'Dagger',
			'Staff',
			'Wand'
		]
	},
	'hunter': {
		'races' : ['dwarf', 'orc', 'troll', 'nightelf', 'tauren'],
		'specs': ['Beast Master', 'Survival', 'Marksmanship'],
		'weapons': [
			'One-Handed Axe',
			'One-Handed Sword',
			'Two-Handed Axe',
			'Two-Handed Sword',
			'Dagger',
			'Polearm',
			'Staff',
			'Fist Weapon'
		]
	},
	'druid': {
		'races' : ['nightelf', 'tauren'],
		'specs': ['Restoration', 'Balance', 'Feral Combat'],
		'weapons': [
			'One-Handed Mace',
			'Two-Handed Mace',
			'Dagger',
			'Polearm',
			'Staff',
			'Fist Weapon'
		]
	},
	'shaman': {
		'races' : ['orc', 'troll', 'tauren'],
		'specs': ['Restoration', 'Elemental', 'Enhancement'],
		'weapons': [
			'One-Handed Axe',
			'One-Handed Mace',
			'Two-Handed Axe',
			'Two-Handed Mace',
			'Dagger',
			'Staff',
			'Fist Weapon'
		]
	}
}
const PROFESSIONS = {
	'engineering': ['mining'],
	'blacksmithing': ['mining'],
	'jewelcrafting': ['mining'],
	'tailoring': [
		'enchanting', 'your choice', 'mining', 'herbalism', 'skinning'
	],
	'enchanting': [
		'blacksmithing', 'your choice', 'skinning', 'herbalism', 'mining'
	],
	'alchemy': ['herbalism'],
	'leatherworking': ['skinning'],
	'mining': ['skinning', 'herbalism', 'your choice'],
	'skinning': ['herbalism', 'your choice'],
	'your choice': ['your choice']
}


func _ready() -> void:
	randomize()
	hitButton()


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
	var weapon: String = CLASSES[randomClass]['weapons'].pick_random()
	var profession1: String = getRandomDictItem(PROFESSIONS, true)[1]
	var profession2: String = PROFESSIONS[profession1].pick_random()
	var professions: String = \
		 profession1 + \
		' and ' + \
		profession2
	
	return [
		gender + ' ' + race + ' ' + spec + ' ' + randomClass,
		weapon,
		professions
		]


func hitButton():
	var randomCharacter = getRandomCharacter()
	
	$Character.text = randomCharacter[0]
	$Weapon.text = randomCharacter[1]
	$Professions.text = randomCharacter[2]


func _on_button_button_down() -> void:
	hitButton()
