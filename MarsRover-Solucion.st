!classDefinition: #TestLog category: 'MarsRover-Solucion'!
TestCase subclass: #TestLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 20:02:19'!
test01PositionLogIsEmptyWhenNoCommands

	| aMarsRover positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	positionLog:= PositionLog new.
	aMarsRover addService: positionLog .
	aMarsRover processCommands: ''.
	
	
	self assert: 0 equals: (aMarsRover managers first log size).
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:49:23'!
test02PositionLogIsCorrectWhenMarsRoverMovesForward

	| aMarsRover positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	positionLog:= PositionLog new.
	aMarsRover addService: positionLog.
	aMarsRover processCommands: 'f'.
	
	
	self assert: 1 equals: (aMarsRover managers first log) size.
	self assert: '0@1' equals: aMarsRover managers first log first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:50:27'!
test03PositionLogIsCorrectWhenMarsRoverMovesBackward

	| aMarsRover positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	positionLog:= PositionLog new.
	aMarsRover addService: positionLog.
	aMarsRover processCommands: 'b'.
	
	
	self assert: 1 equals: aMarsRover managers first log size.
	self assert: '0@-1' equals: (aMarsRover managers first) log first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:50:56'!
test04DirectionLogIsCorrectWhenMarsRoverTurnRight

	| aMarsRover directionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	directionLog:= DirectionLog new.
	aMarsRover addService: directionLog.
	aMarsRover processCommands: 'r'.
	
	
	self assert: 1 equals: aMarsRover managers first log size.
	self assert: 'Este' equals: aMarsRover managers first log first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:51:23'!
test05DirectionLogIsCorrectWhenMarsRoverTurnLeft

	| aMarsRover directionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	directionLog:= DirectionLog new.
	aMarsRover addService: directionLog.
	aMarsRover processCommands: 'l'.
	
	
	self assert: 1 equals: aMarsRover managers first log  size.
	self assert: 'Oeste' equals: aMarsRover managers first log first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:51:40'!
test06DirectionLogIsCorrectWhenMarsRoverTurnLeftHeadingOtherDirection

	| aMarsRover directionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #East.
	directionLog:= DirectionLog new.
	aMarsRover addService: directionLog.
	aMarsRover processCommands: 'l'.
	
	
	self assert: 1 equals: aMarsRover managers first log size.
	self assert: 'Norte' equals: aMarsRover managers first log first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:52:13'!
test08DirectionAndPositionLogIsCorrectWhenMarsRoverMovesForward

	| aMarsRover directionLog positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #East.
	positionLog:= PositionLog new.
	directionLog:= DirectionLog new.
	aMarsRover addService: positionLog.
	aMarsRover addService: directionLog.
	aMarsRover processCommands: 'f'.
	
	self assert: 1 equals: aMarsRover managers first log size .
	self assert: '1@0' equals: aMarsRover managers first log first .
	
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:58:38'!
test09DirectionAndPositionLogIsCorrectWhenMarsRoverMovesForwardAndTurnRigth

	| aMarsRover  directionLog positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	positionLog:= PositionLog new.
	directionLog:= DirectionLog new.
	aMarsRover addService: positionLog.
	aMarsRover addService: directionLog.
	aMarsRover processCommands: 'fr'.
	
	self assert: 2 equals: aMarsRover managers first log size .
	self assert: (OrderedCollection with: '0@1' with: 'Este')equals: aMarsRover managers first log .
	
	
	
	! !


!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestWindow category: 'MarsRover-Solucion'!
TestCase subclass: #TestWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:59:15'!
test01PositionWindowIsCorrect
	| aMarsRover |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	
	aMarsRover addService: PositionWindow new.
	aMarsRover processCommands: 'f'.
	
	self assert: ' 0@1' equals: aMarsRover managers first visualize .
! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:59:58'!
test02DirectionWindowIsCorrect
	| aMarsRover |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	
	aMarsRover addService: DirectionWindow new.
	aMarsRover processCommands: 'r'.
	
	self assert: ' Este' equals: aMarsRover managers first visualize .
! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 20:00:14'!
test03WindowWithPositionAndDirectionIsCorrect
	| aMarsRover |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	
	aMarsRover addService: PositionWindow new.
	aMarsRover addService: DirectionWindow new.
	aMarsRover processCommands: 'fr'.
	
	self assert: ' 0@1 Este' equals: aMarsRover managers first visualize .
! !


!classDefinition: #LogManager category: 'MarsRover-Solucion'!
Object subclass: #LogManager
	instanceVariableNames: 'logs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!LogManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:43:08'!
add: aTypeOfLog

	logs add: aTypeOfLog .! !

!LogManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:08:14'!
combineInUniqueLog

	| uniqueLog |
	uniqueLog:= OrderedCollection new.
	1 to: logs first numberOfMovements do:[:index|
	logs do:[:aLog| (aLog log) at: index ifPresent:[:value|uniqueLog add: value]]].

	^uniqueLog.! !

!LogManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:42:51'!
initialize
	
	logs:= OrderedCollection new.
	! !

!LogManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:49:52'!
log

	^ self combineInUniqueLog.! !

!LogManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:10:44'!
updateWithNewChangesOf: aMarsRover

	logs do: [:aLog| aLog registerANewMovementOf: aMarsRover ].! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head logManager windowManager managers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'TP 7/21/2021 19:38:48'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	managers:= OrderedCollection new.
	"logManager:=nil.
	windowManager:=nil."
	
	! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'TP 7/20/2021 10:46:23'!
moveDown

	position := position + (0@-1).
	self update.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'TP 7/20/2021 10:46:23'!
moveLeft

	position := position + (-1@0).
	self update.
	! !

!MarsRover methodsFor: 'dd - moving' stamp: 'TP 7/20/2021 10:46:22'!
moveRight

	position := position + (1@0).
	self update.
	! !

!MarsRover methodsFor: 'dd - moving' stamp: 'TP 7/20/2021 10:46:30'!
moveUp

	position := position + (0@1).
	self update.
	! !


!MarsRover methodsFor: 'dd - heading' stamp: 'TP 7/20/2021 10:47:15'!
headEast

	head := MarsRoverHeadFacingEast of: self.
	self update.
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'TP 7/20/2021 10:47:19'!
headNorth

	head := MarsRoverHeadFacingNorth of: self.
	self update.
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'TP 7/20/2021 10:52:03'!
headSouth

	head := MarsRoverHeadFacingSouth of: self.
	self update.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'TP 7/20/2021 10:52:09'!
headWest

	head := MarsRoverHeadFacingWest of: self.
	self update.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:56:43'!
addService: anElementOfService

	| managerOfTheService |
	managerOfTheService:=managers detect:[:aManager| aManager isKindOf: anElementOfService manager] 
	ifNone:[managers add:(anElementOfService manager new)].
	
	
	managerOfTheService add: anElementOfService .
	anElementOfService setForAMarsRover:self.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:51:44'!
direction
	
	^head nameForLog .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:14:27'!
logManager

	^logManager .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:49:10'!
managers

	^managers.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:32:01'!
position

	^position.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:40:17'!
update
	
	
	managers do:[:aManager| aManager updateWithNewChangesOf: self].
	"logManager ifNotNil: [logManager updateWithNewChangesOf: self].
	
	windowManager ifNotNil: [windowManager updateWithNewChangesOf: self].
	"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'TP 7/19/2021 21:34:57'!
nameForLog

	self subclassResponsibility .! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 08:22:48'!
nameForLog

	^'Este'.! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 08:22:55'!
nameForLog

	^'Norte'.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 08:23:00'!
nameForLog

	^'Sur'.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 08:23:05'!
nameForLog

	^'Oeste'.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #TypeOfLogs category: 'MarsRover-Solucion'!
Object subclass: #TypeOfLogs
	instanceVariableNames: 'dictionary lastEntry numberOfMovements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:57:07'!
initialize

	dictionary:= Dictionary new.
	numberOfMovements :=1.
	! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:57:07'!
log
	
	^dictionary.! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:34:26'!
manager

	^LogManager.! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:07:27'!
numberOfMovements

	^numberOfMovements .! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 10:55:28'!
registerANewMovementOf: aMarsRover

	self subclassResponsibility .! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:36:36'!
setForAMarsRover:aMarsRover

	self subclassResponsibility .! !


!classDefinition: #DirectionAndPositionLog category: 'MarsRover-Solucion'!
TypeOfLogs subclass: #DirectionAndPositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!DirectionAndPositionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:57:07'!
registerANewMovementOf: aMarsRover
	
	| newDirection newPosition|
	newDirection:=aMarsRover direction.
	(newDirection=lastEntry second) ifFalse: [
		dictionary add: newDirection .
		lastEntry at:2 put:newDirection ].
	
	newPosition:=aMarsRover position.
	(newPosition=lastEntry first) ifFalse: [
		dictionary add: newPosition printString.
		lastEntry at:1 put:newPosition ].! !

!DirectionAndPositionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 16:36:05'!
setForAMarsRover:aMarsRover

	lastEntry:= OrderedCollection with: aMarsRover position with: aMarsRover direction.
	
	
! !


!classDefinition: #DirectionLog category: 'MarsRover-Solucion'!
TypeOfLogs subclass: #DirectionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:57:07'!
registerANewMovementOf: aMarsRover
	
	| newDirection |
	newDirection:=aMarsRover direction.
	(newDirection=lastEntry) ifFalse: [
		dictionary add: (Association key: numberOfMovements value: newDirection) .
		lastEntry := newDirection ].
	
	numberOfMovements := numberOfMovements +1.
	! !

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:52:35'!
setForAMarsRover:aMarsRover

	lastEntry:= aMarsRover direction.
! !


!classDefinition: #PositionLog category: 'MarsRover-Solucion'!
TypeOfLogs subclass: #PositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!PositionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:57:07'!
registerANewMovementOf: aMarsRover
	
	| newPosition |
	newPosition:=aMarsRover position.
	(newPosition=lastEntry) ifFalse: [
		dictionary add: (Association key: numberOfMovements value: newPosition printString).
		lastEntry := newPosition ].
	
	numberOfMovements := numberOfMovements +1.
	
	
	! !

!PositionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:31:42'!
setForAMarsRover:aMarsRover

	lastEntry:= aMarsRover position.
! !


!classDefinition: #TypeOfWindow category: 'MarsRover-Solucion'!
Object subclass: #TypeOfWindow
	instanceVariableNames: 'observedVariable'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TypeOfWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:04:49'!
addStateFrom:currentResult

	self subclassResponsibility .! !

!TypeOfWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:34:42'!
manager

	^WindowManager.! !

!TypeOfWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 19:57:29'!
setForAMarsRover: aMarsRover
		
	self.! !

!TypeOfWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 18:04:26'!
updateWith: aMarsRover

	self subclassResponsibility .! !


!classDefinition: #DirectionWindow category: 'MarsRover-Solucion'!
TypeOfWindow subclass: #DirectionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!DirectionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:47:03'!
addStateFrom:currentResult

	^ currentResult,' ',observedVariable .! !

!DirectionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:46:42'!
updateWith: aMarsRover

	observedVariable := aMarsRover direction.! !


!classDefinition: #PositionWindow category: 'MarsRover-Solucion'!
TypeOfWindow subclass: #PositionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!PositionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:36:45'!
addStateFrom:currentResult

	^ currentResult,' ',observedVariable printString .! !

!PositionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:27:38'!
updateWith: aMarsRover

	observedVariable := aMarsRover position.! !


!classDefinition: #WindowManager category: 'MarsRover-Solucion'!
Object subclass: #WindowManager
	instanceVariableNames: 'windows'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!WindowManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:16:25'!
add: aTypeOfWindow

	windows add: aTypeOfWindow .! !

!WindowManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:16:04'!
initialize

	windows:= OrderedCollection new.! !

!WindowManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:33:56'!
updateWithNewChangesOf: aMarsRover
	
	windows do:[:aTypeOfWindow| aTypeOfWindow updateWith: aMarsRover ].

	! !

!WindowManager methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:35:59'!
visualize

	^windows inject: '' into:[:currentResult :aTypeOfWindow| aTypeOfWindow addStateFrom:currentResult ].! !
