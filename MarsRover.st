!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'rover initialPosition initialDirection commandForward commandBackwards commandLeft commandRight invalidCommand north south east west'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:51:24'!
setUp
	initialPosition := 1@1.
	north := 'N'.
	south := 'S'.
	east := 'E'.
	west := 'O'.
	initialDirection := north.
	commandForward := 'f'.
	commandBackwards := 'b'.
	commandLeft := 'l'.
	commandRight := 'r'.
	rover := MarsRover withInitialPoint:initialPosition andDirection:initialDirection.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:41:00'!
test01roverMovesForwardOnce
	rover command:commandForward.
	self assert: rover itsPosition = (1@2).
	self assert: rover cardinalPoint = initialDirection.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:40:59'!
test02roverMovesBackwardsOnce
	rover command:commandBackwards.
	self assert: rover itsPosition = (1@0).
	self assert: rover cardinalPoint = initialDirection.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:50:35'!
test03RoverTurnsToTheLeftAndStaysAtTheSamePoint
	rover command:commandLeft.
	self assert: rover itsPosition = (1@1).
	self assert: rover cardinalPoint =west.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:50:57'!
test04RoverTurnsToTheRightAndStaysAtTheSamePoint
	rover command:commandRight.
	self assert: rover itsPosition = (1@1).
	self assert: rover cardinalPoint =east.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:51:19'!
test05InvalidCommandDoesntChangePositionAndDirection
	| completelyInvalidCommand |
	completelyInvalidCommand := 'w'.
	
	self should:[rover command: completelyInvalidCommand]  raise:Error withExceptionDo:[ :anError | self assert: anError messageText equals: MarsRover invalidCommandErrorDescription ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:51:38'!
test06RoverTurnsToTheLeftAndMovesForwardOnce
	rover command:(commandLeft , ' ', commandForward).
	self assert: rover itsPosition = (0@1).
	self assert: rover cardinalPoint = west.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:51:44'!
test07RoverTurnsToTheLeftAndMovesBackwardsOnce
	rover command:(commandLeft , ' ', commandBackwards).
	self assert: rover itsPosition = (2@1).
	self assert: rover cardinalPoint =west.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:51:54'!
test08RoverTurnsToTheRightAndMovesForwardOnce
	rover command:(commandRight , ' ', commandForward).
	self assert: rover itsPosition = (2@1).
	self assert: rover cardinalPoint = east.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:51:58'!
test09RoverTurnsToTheRightAndMovesBackwardsOnce
	rover command:(commandRight , ' ', commandBackwards).
	self assert: rover itsPosition = (0@1).
	self assert: rover cardinalPoint = east.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:40:59'!
test10RoverMovesUntilCommandIsInvalid
	| partiallyInvalidCommand |
	partiallyInvalidCommand := 'l l l f w r f f'.
	
	self should:[rover command: partiallyInvalidCommand]  raise:Error withExceptionDo:[ :anError | self assert: anError messageText equals: MarsRover invalidCommandErrorDescription. self assert:[rover itsPosition = (2@1)]. ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:41:00'!
test11StringWithEmptySpaceIsAnInvalidCommand
	| completelyInvalidCommand |
	completelyInvalidCommand := ' '.
	
	self should:[rover command: completelyInvalidCommand]  raise:Error withExceptionDo:[ :anError | self assert: anError messageText equals: MarsRover invalidCommandErrorDescription ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:52:10'!
test12UseAllCommands
	| command |
	command := 'l f r b'.
	rover command:command.
	
	self assert: rover itsPosition = (0@0).
	self assert: rover cardinalPoint = north.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:52:16'!
test13UseAllCommandsMultipleTimesAndDirectionIsNorth
	| command |
	command := 'f f r f r b f l b l b b'.
	rover command:command.
	
	self assert: rover itsPosition = (1@1).
	self assert: rover cardinalPoint = north.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:52:21'!
test14UseAllCommandsMultipleTimesAndDirectionIsSouth
	| command |
	command := 'f f r f r b f l b l b b l l'.
	rover command:command.
	
	self assert: rover itsPosition = (1@1).
	self assert: rover cardinalPoint = south.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:52:26'!
test15UseAllCommandsMultipleTimesAndDirectionIsEast
	| command |
	command := 'f f r f r b f l b l b b r'.
	rover command:command.
	
	self assert: rover itsPosition = (1@1).
	self assert: rover cardinalPoint = east.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:52:31'!
test16UseAllCommandsMultipleTimesAndDirectionIsWest
	| command |
	command := 'f f r f r b f l b l b b l'.
	rover command:command.
	
	self assert: rover itsPosition = (1@1).
	self assert: rover cardinalPoint = west.! !


!classDefinition: #CardinalPoint category: 'MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:33:25'!
IsValueOfCardinalPointClass
	^self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:28:40'!
decideNextPositionWith:aValue ForRover:aRover
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:14:02'!
determineAngleByDirection
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:38:30'!
symbol
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: 'MarsRover'!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:01:14'!
checkIfAngleIsCardinalPoint:anAngle
	| subclass |
	subclass _ CardinalPoint allSubclasses
		detect: [ :class |
			class checkIfThisAngleIsCardinalPoint:anAngle ]
		ifNone: [^self error:'error'].
	^ subclass new.! !

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:58:47'!
checkIfThisAngleIsCardinalPoint:anAngle
	self subclassResponsibility.! !

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 16:33:01'!
checkIfValueIsCardinalPoint:aValue
	self subclassResponsibility.! !

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:46:19'!
with:aValue
| subclass |
	subclass _ CardinalPoint allSubclasses
		detect: [ :class |
			class checkIfValueIsCardinalPoint: aValue ]
		ifNone: [^self error:'error'].
	^ subclass new.! !


!classDefinition: #Este category: 'MarsRover'!
CardinalPoint subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:30:29'!
decideNextPositionWith:aValue ForRover:aRover
	^aRover itsPosition + (aValue@0).! !

!Este methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:14:26'!
determineAngleByDirection
	^0.! !

!Este methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:38:43'!
symbol
 	^'E'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'MarsRover'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:59:57'!
checkIfThisAngleIsCardinalPoint:anAngle
	^anAngle = 0.! !

!Este class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:33:57'!
checkIfValueIsCardinalPoint:aValue
	^aValue = 'E'.! !


!classDefinition: #Norte category: 'MarsRover'!
CardinalPoint subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:30:50'!
decideNextPositionWith:aValue ForRover:aRover
	^aRover itsPosition + (0@aValue).! !

!Norte methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:14:37'!
determineAngleByDirection
	^90.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:38:55'!
symbol
 	^'N'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'MarsRover'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:00:07'!
checkIfThisAngleIsCardinalPoint:anAngle
	^anAngle = 90.! !

!Norte class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:34:09'!
checkIfValueIsCardinalPoint:aValue
	^aValue = 'N'.! !


!classDefinition: #Oeste category: 'MarsRover'!
CardinalPoint subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:30:34'!
decideNextPositionWith:aValue ForRover:aRover
	^aRover itsPosition + (aValue negated@0).! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:14:44'!
determineAngleByDirection
	^180.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:39:02'!
symbol
 	^'O'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'MarsRover'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:00:15'!
checkIfThisAngleIsCardinalPoint:anAngle
	^anAngle = 180.! !

!Oeste class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:34:20'!
checkIfValueIsCardinalPoint:aValue
	^aValue = 'O'.! !


!classDefinition: #Sur category: 'MarsRover'!
CardinalPoint subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:31:04'!
decideNextPositionWith:aValue ForRover:aRover
	^aRover itsPosition + (0@aValue negated).! !

!Sur methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:14:53'!
determineAngleByDirection
	^270.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:39:08'!
symbol
 	^'S'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:00:23'!
checkIfThisAngleIsCardinalPoint:anAngle
	^anAngle = 270.! !

!Sur class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:34:14'!
checkIfValueIsCardinalPoint:aValue
	^aValue = 'S'.! !


!classDefinition: #CommandType category: 'MarsRover'!
Object subclass: #CommandType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CommandType methodsFor: 'as yet unclassified' stamp: 'MG 6/30/2021 23:22:04'!
movementToMake: aRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandType class' category: 'MarsRover'!
CommandType class
	instanceVariableNames: 'movingDirection'!

!CommandType class methodsFor: 'as yet unclassified' stamp: 'MG 6/30/2021 16:54:00'!
checkIfValueIsCommandType:aValue
	self subclassResponsibility.! !

!CommandType class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 01:42:50'!
with:aCommand
	| subclass |
	subclass _ CommandType allSubclasses
		detect: [ :class |
			class checkIfValueIsCommandType: aCommand ]
		ifNone: [^self error:'error'].
	^ subclass new.! !


!classDefinition: #Backward category: 'MarsRover'!
CommandType subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Backward methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:41:55'!
movementToMake: aRover
	^aRover move:(-1).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'MarsRover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'MG 6/30/2021 16:54:40'!
checkIfValueIsCommandType:aValue
	^aValue = 'b'.! !


!classDefinition: #Forward category: 'MarsRover'!
CommandType subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'MG 6/30/2021 23:22:41'!
movementToMake: aRover
	^aRover move:1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'nil' stamp: 'MG 6/30/2021 16:54:53'!
checkIfValueIsCommandType:aValue
	^aValue = 'f'.! !


!classDefinition: #Left category: 'MarsRover'!
CommandType subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Left methodsFor: 'as yet unclassified' stamp: 'MG 6/30/2021 23:22:52'!
movementToMake: aRover
	^aRover turn:90.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'MarsRover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'nil' stamp: 'MG 6/30/2021 16:55:09'!
checkIfValueIsCommandType:aValue
	^aValue = 'l'.! !


!classDefinition: #Right category: 'MarsRover'!
CommandType subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Right methodsFor: 'as yet unclassified' stamp: 'MG 6/30/2021 23:23:05'!
movementToMake: aRover
	^aRover turn:-90.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'MarsRover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'nil' stamp: 'MG 6/30/2021 16:55:14'!
checkIfValueIsCommandType:aValue
	^aValue = 'r'.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'positionPoint cardinalPoint angle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:42:18'!
cardinalPoint
	^cardinalPoint symbol.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:43:59'!
command: aStringOfCommands
	|aCollectionOfCommands |
	aCollectionOfCommands := aStringOfCommands findTokens: ' '.
	aCollectionOfCommands isEmpty ifTrue:[self error: self class invalidCommandErrorDescription].
	aCollectionOfCommands do: [:eachCommand | self processCommand:eachCommand].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MG 6/30/2021 16:47:46'!
itsPosition
	^positionPoint.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 17:42:56'!
move:aValue
	positionPoint := cardinalPoint decideNextPositionWith:aValue ForRover:self.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:42:14'!
processCommand:aCommand
	| aCommandType |
	aCommandType := CommandType with:aCommand.
	aCommandType movementToMake: self. ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 18:44:17'!
turn:anAngle
	angle := (angle + anAngle) \\ 360.
	
	cardinalPoint := CardinalPoint checkIfAngleIsCardinalPoint:angle.! !


!MarsRover methodsFor: 'initialization' stamp: 'MG 7/1/2021 18:46:19'!
initializeWith: aPoint and: aCardinalPoint 
	positionPoint := aPoint.
	cardinalPoint := CardinalPoint with:aCardinalPoint.
	angle := cardinalPoint determineAngleByDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MG 7/1/2021 00:16:01'!
invalidCommandErrorDescription
	^'error'.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MG 6/30/2021 17:11:52'!
withInitialPoint: aPoint andDirection: aString 
	^self new initializeWith:aPoint and:aString.! !
