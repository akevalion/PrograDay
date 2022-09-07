"
An AlgoTest is a test class for testing the behavior of Algo
"
Class {
	#name : #AlgoTest,
	#superclass : #TestCase,
	#category : #'ProgrammerDay-Tests'
}

{ #category : #tests }
AlgoTest >> testBasic [
	| input  object |
	input := '5 16
################
#............K.#
#.P...#........#
#..............#
#############E##'.
	object := Algo new.
	object input: input.
	
	self assert: object matrix numberOfRows equals: 5.
	self assert: object matrix numberOfColumns equals: 16.
	self assert: object keyPosition equals: 14@2.
	self assert: object exitPosition equals: 14@5.
	self assert: object playerPosition equals: 3@3.
	self flag: #TODO.
	self assert: object output equals: -1
]
