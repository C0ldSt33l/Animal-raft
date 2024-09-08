extends Node

var FUNC_DIC := {
	'Chicken': [Callable(self, 'Chicken_build_skill'), Callable(self, 'Chicken_attack_skill')],
	'Crab': [Callable(self, 'Crab_build_skill'), Callable(self, 'Crab_attack_skill')],
	'Toad': [Callable(self, 'Toad_build_skill'), Callable(self, 'Toad_attack_skill')],
	'Monkey': [Callable(self, 'Monkey_build_skill'), Callable(self, 'Monkey_attack_skill')],
	'Pig': [Callable(self, 'Pig_build_skill'), Callable(self, 'Pig_attack_skill')],
	'Dog': [Callable(self, 'Dog_build_skill'), Callable(self, 'Dog_attack_skill')],
	'Cow': [Callable(self, 'Cow_build_skill'), Callable(self, 'Cow_attack_skill')],
	'Goose': [Callable(self, 'Goose_build_skill'), Callable(self, 'Goose_attack_skill')],
	'Gorilla': [Callable(self, 'Gorilla_build_skill'), Callable(self, 'Gorilla_attack_skill')],
	'Boar': [Callable(self, 'Boar_build_skill'), Callable(self, 'Boar_attack_skill')],
	'Moose': [Callable(self, 'Moose_build_skill'), Callable(self, 'Moose_attack_skill')],
	'Cat': [Callable(self, 'Cat_build_skill'), Callable(self, 'Cat_attack_skill')],
	'Goat': [Callable(self, 'Goat_build_skill'), Callable(self, 'Goat_attack_skill')],
	'Sheep': [Callable(self, 'Sheep_build_skill'), Callable(self, 'Sheep_attack_skill')],
	'Turtle': [Callable(self, 'Turtle_build_skill'), Callable(self, 'Turtle_attack_skill')],
	'Porcupine': [Callable(self, 'Porcupine_build_skill'), Callable(self, 'Porcupine_attack_skill')],
	'Skunk': [Callable(self, 'Skunk_build_skill'), Callable(self, 'Skunk_attack_skill')],
	'Wolf': [Callable(self, 'Wolf_build_skill'), Callable(self, 'Wolf_attack_skill')],
	
}

func Chicken_build_skill():
	print('ko')
func Chicken_attack_skill():
	print('agressive ko')
	
func Crab_build_skill():
	print('clacking')
func Crab_attack_skill():
	print('agressive clacking')
	
func Toad_build_skill():
	print('croaking')
func Toad_attack_skill():
	print('agressive croaking')
	
func Monkey_build_skill():
	print('Monkey')
func Monkey_attack_skill():
	print('agressive Monkey')
	
func Pig_build_skill():
	print('oinc')
func Pig_attack_skill():
	print('agessive oinc')

func Dog_build_skill():
	print('barking')
func Dog_attack_skill():
	print('barking')

func Cow_build_skill():
	print('moo')
func Cow_attack_skill():
	print('agressive moo')
	
func Goose_build_skill():
	print('its a GOOSE!')
func Goose_attack_skill():
	print('its a agressive GOOSE!')
	
func Gorilla_build_skill():
	print('Gorilla')
func Gorilla_attack_skill():
	print('agressive Gorilla')
	
func Boar_build_skill():
	print('boar')
func Boar_attack_skill():
	print('hard boar')
	
func Moose_build_skill():
	print('Moose')
func Moose_attack_skill():
	print('agressive Moose')
	
func Cat_build_skill():
	print('meowing')
func Cat_attack_skill():
	print('scream')
	
func Goat_build_skill():
	print('goat')
func Goat_attack_skill():
	print('ram')

func Sheep_build_skill():
	print('Sheep')
func Sheep_attack_skill():
	print('aggresive cloud')
	
func Turtle_build_skill():
	print('turtle')
func Turtle_attack_skill():
	print('turtle')
	
func Porcupine_build_skill():
	print('Porcupine')
func Porcupine_attack_skill():
	print('agressive Porcupine')
		
func Skunk_build_skill():
	print('Skunk')
func Skunk_attack_skill():
	print('Skunk attack')
	
func Wolf_build_skill():
	print('woof')
func Wolf_attack_skill():
	print('agressive woof')
