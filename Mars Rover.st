!classDefinition: #Test category: 'Mars Rover'!
TestCase subclass: #Test
	instanceVariableNames: 'aPoint aCardinalPoint aMarsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Test methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 18:48:34'!
setUp
	aPoint := 1@1.
	aCardinalPoint := 'N'.
	aMarsRover := MarsRover withInitialPoint:aPoint andCardinalPoint:aCardinalPoint.! !

!Test methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 18:54:32'!
test1
	| expectedPosition |
	expectedPosition := 1@2.
	
	aMarsRover comando: 'f'.
	self assert: aMarsRover itsPosition = expectedPosition.
	self assert: aMarsRover cardinalPoint = aCardinalPoint.! !

!Test methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 18:54:59'!
test2
	| expectedPosition |
	expectedPosition := 1@0.
	
	aMarsRover comando: 'b'.
	self assert: aMarsRover itsPosition = expectedPosition.
	self assert: aMarsRover cardinalPoint = aCardinalPoint.! !

!Test methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 19:02:16'!
test3
	| expectedDirection|
	expectedDirection := 'o'.
	
	aMarsRover comando: 'l'.
	self assert: aMarsRover itsPosition = aPoint.
	self assert: aMarsRover cardinalPoint = expectedDirection.! !

!Test methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 19:03:40'!
test4
	| expectedDirection|
	expectedDirection := 'e'.
	
	aMarsRover comando: 'r'.
	self assert: aMarsRover itsPosition = aPoint.
	self assert: aMarsRover cardinalPoint = expectedDirection.! !

!Test methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 19:17:34'!
test5
	| completelyInvalidCommand |
	completelyInvalidCommand := 'w'.
	
	self should:[aMarsRover comando: completelyInvalidCommand]  raise:Error withExceptionDo:[ :anError | self assert: anError messageText equals: MarsRover invalidCommandErrorDescription ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Test class' category: 'Mars Rover'!
Test class
	instanceVariableNames: 'aMarsRover'!


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'cardinalPoint position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'mg 6/29/2021 18:17:55'!
initializeWithInitialPoint: aPoint andCardinalPoint: aCardinalPoint 
	position := aPoint.
	cardinalPoint := aCardinalPoint.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'mg 6/30/2021 14:20:27'!
actualPosition
	^OrderedCollection with:position with:cardinalPoint.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 18:18:47'!
cardinalPoint
	^cardinalPoint! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:21:06'!
comando: unaCadenaDeComandos 
	| unComando |
	unComando := MarsRoversCommandType with:unaCadenaDeComandos.	
	unComando beExecutedBy:self.
	"^self error: self class invalidCommandErrorDescription."! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 18:18:29'!
itsPosition
	^position.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:20:10'!
moverse:nextPosition
	position := nextPosition first.
	cardinalPoint := nextPosition last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 19:16:14'!
invalidCommandErrorDescription
	^'error'.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 18:17:13'!
withInitialPoint: aPoint andCardinalPoint: aCardinalPoint
	^self new initializeWithInitialPoint: aPoint andCardinalPoint:aCardinalPoint.! !


!classDefinition: #MarsRoversCommandType category: 'Mars Rover'!
Object subclass: #MarsRoversCommandType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoversCommandType methodsFor: 'as yet unclassified' stamp: 'mg 6/30/2021 14:16:50'!
beExecutedBy:aMarsRover
	|newPosition|
	newPosition := (self calculateNextMovement:(aMarsRover actualPosition)).
	aMarsRover moverse: newPosition.
.! !

!MarsRoversCommandType methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 19:50:12'!
calculateNextMovement:aPosition
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoversCommandType class' category: 'Mars Rover'!
MarsRoversCommandType class
	instanceVariableNames: ''!

!MarsRoversCommandType class methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:24:14'!
checkThisValueCanBeOfClass: unComando
	self subclassResponsibility.! !

!MarsRoversCommandType class methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:25:42'!
with:unComando
	| subclass |
	subclass _ MarsRoversCommandType allSubclasses
		detect: [ :class |
			class checkThisValueCanBeOfClass: unComando ]
		ifNone: [ self error: 'error' ].
	^ subclass new.! !


!classDefinition: #Backward category: 'Mars Rover'!
MarsRoversCommandType subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Backward methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:14:34'!
calculateNextMovement:aPosition
	| cardinalPoint point |
	cardinalPoint := aPosition last.
	point := aPosition first.
	cardinalPoint = 'n' ifTrue:[^#((point + (0@-1)) cardinalPoint )].
	cardinalPoint = 's' ifTrue:[^#((point + (0@1)) cardinalPoint )].
	cardinalPoint = 'e' ifTrue:[^#((point + (-1@0)) cardinalPoint )].
	cardinalPoint = 'o' ifTrue:[^#((point + (1@0)) cardinalPoint )].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'Mars Rover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:24:35'!
checkThisValueCanBeOfClass: unComando
	^unComando = 'b'.! !


!classDefinition: #Forward category: 'Mars Rover'!
MarsRoversCommandType subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'mg 6/30/2021 14:13:59'!
calculateNextMovement:aPosition
	| cardinalPoint point |
	cardinalPoint := aPosition last.
	point := aPosition first.
	cardinalPoint = 'n' ifTrue:[^#((point + (0@1)) cardinalPoint )].
	cardinalPoint = 's' ifTrue:[^#((point + (0@-1)) cardinalPoint )].
	cardinalPoint = 'e' ifTrue:[^#((point + (1@0)) cardinalPoint )].
	cardinalPoint = 'o' ifTrue:[^#((point + (-1@0)) cardinalPoint )].
	^#((point + (0@1)) cardinalPoint ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'Mars Rover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:24:42'!
checkThisValueCanBeOfClass: unComando
	^unComando = 'f'.! !


!classDefinition: #Left category: 'Mars Rover'!
MarsRoversCommandType subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Left methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:15:55'!
calculateNextMovement:aPosition
	| cardinalPoint point |
	cardinalPoint := aPosition last.
	point := aPosition first.
	cardinalPoint = 'n' ifTrue:[^#(point 'o' )].
	cardinalPoint = 's' ifTrue:[^#(point 'e' )].
	cardinalPoint = 'e' ifTrue:[^#(point 'n' )].
	cardinalPoint = 'o' ifTrue:[^#(point 's')].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'Mars Rover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:24:47'!
checkThisValueCanBeOfClass: unComando
	^unComando = 'l'.! !


!classDefinition: #Right category: 'Mars Rover'!
MarsRoversCommandType subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Right methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:17:31'!
calculateNextMovement:aPosition
	| cardinalPoint point|
	cardinalPoint := aPosition last.
	point := aPosition first.
	cardinalPoint = 'n' ifTrue:[^#(point 'e' )].
	cardinalPoint = 's' ifTrue:[^#(point 'o' )].
	cardinalPoint = 'e' ifTrue:[^#(point 's' )].
	cardinalPoint = 'o' ifTrue:[^#(point 'n')].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'Mars Rover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'as yet unclassified' stamp: 'mg 6/29/2021 20:24:54'!
checkThisValueCanBeOfClass: unComando
	^unComando = 'r'.! !
