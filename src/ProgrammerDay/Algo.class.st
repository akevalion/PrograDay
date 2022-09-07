Class {
	#name : #Algo,
	#superclass : #Object,
	#instVars : [
		'matrix',
		'keyPosition',
		'exitPosition',
		'playerPosition'
	],
	#category : #ProgrammerDay
}

{ #category : #accessing }
Algo >> exitPosition [
	^ exitPosition
]

{ #category : #accessing }
Algo >> input: aString [ 
	matrix := self readFromString: aString
]

{ #category : #accessing }
Algo >> keyPosition [
	^ keyPosition
]

{ #category : #accessing }
Algo >> matrix [
	^ matrix
]

{ #category : #public }
Algo >> output [
	| stepsToKey stepsToExit |
	stepsToKey := self shortestStepNumberTo: self keyPosition.
	stepsToKey = -1 ifTrue: [ ^ -1 ].
	stepsToExit := self shortestStepNumberTo: self exitPosition.
	stepsToExit = -1 ifTrue: [ ^ -1 ].
	^ stepsToKey + stepsToExit
]

{ #category : #accessing }
Algo >> playerPosition [
	^ playerPosition
]

{ #category : #accessing }
Algo >> readFromString: aString [
	| lines firstLine rows columns res |
	lines := aString lines.
	firstLine := lines first substrings: ' '.
	rows := firstLine first asNumber.
	columns := firstLine second asNumber.
	res := Array2D rows: rows columns: columns.
	
	1 to: rows do: [ :row |
		1 to: columns do: [ :column | | position value  |
			value := self valueFor: lines row: row column: column.
			position := column @ row .
			value = $K
				ifTrue: [ keyPosition := position ].
			value = $E
				ifTrue: [ exitPosition := position ].
			value = $P
				ifTrue: [ playerPosition := position ].
			res at: row at: column put: value.
			 ] ].
	^ res
]

{ #category : #private }
Algo >> shortestStepNumberTo: aPoint [ 
	^ -1
]

{ #category : #private }
Algo >> valueFor: aCollection at: aPoint [ 
	self shouldBeImplemented.
]

{ #category : #private }
Algo >> valueFor: aCollection row: row column: column [ 
	^ (aCollection at: row + 1) at: column
]
