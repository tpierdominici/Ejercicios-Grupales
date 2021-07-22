!classDefinition: #TestLog category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestLog methodsFor: 'tdd test' stamp: 'TP 7/22/2021 09:50:27'!
test01PositionLogIsEmptyWhenNoCommands

	
	self assertLog: PositionLog ForRoverStartingAt:0@0 heading:#North afterProcessing: '' isOfSize: 0 andRegister: (OrderedCollection new).
	
	
	! !

!TestLog methodsFor: 'tdd test' stamp: 'TP 7/22/2021 09:49:43'!
test02PositionLogIsCorrectWhenMarsRoverMovesForward
	
	
	self assertLog: PositionLog ForRoverStartingAt:0@0 heading:#North afterProcessing: 'f' isOfSize: 1 andRegister: (OrderedCollection with:'0@1').
	
	
	! !

!TestLog methodsFor: 'tdd test' stamp: 'TP 7/22/2021 09:50:44'!
test03PositionLogIsCorrectWhenMarsRoverMovesBackward

	
	self assertLog: PositionLog ForRoverStartingAt:0@0 heading:#North afterProcessing: 'b' isOfSize: 1 andRegister: (OrderedCollection with:'0@-1').
	
	
	! !

!TestLog methodsFor: 'tdd test' stamp: 'TP 7/22/2021 09:51:15'!
test04DirectionLogIsCorrectWhenMarsRoverTurnRight


	
	self assertLog: DirectionLog ForRoverStartingAt:0@0 heading:#North afterProcessing: 'r' isOfSize: 1 andRegister: (OrderedCollection with:'Este').
	
	
	! !

!TestLog methodsFor: 'tdd test' stamp: 'TP 7/22/2021 09:51:48'!
test05DirectionLogIsCorrectWhenMarsRoverTurnLeft

	
	self assertLog: DirectionLog ForRoverStartingAt:0@0 heading:#North afterProcessing: 'l' isOfSize: 1 andRegister: (OrderedCollection with:'Oeste').
	
	! !

!TestLog methodsFor: 'tdd test' stamp: 'TP 7/22/2021 09:52:32'!
test06DirectionLogIsCorrectWhenMarsRoverTurnLeftHeadingOtherDirection

	
	self assertLog: DirectionLog ForRoverStartingAt:0@0 heading:#East afterProcessing: 'l' isOfSize: 1 andRegister: (OrderedCollection with:'Norte').
	
	
	! !

!TestLog methodsFor: 'tdd test' stamp: 'TP 7/22/2021 09:57:07'!
test08DirectionAndPositionLogIsCorrectWhenMarsRoverMovesForward

	
	self assertLogs: DirectionLog and: PositionLog ForRoverStartingAt:0@0 heading:#East afterProcessing: 'f' isOfSize: 1 andRegister: (OrderedCollection with:'1@0').
	
	
	
	! !

!TestLog methodsFor: 'tdd test' stamp: 'TP 7/22/2021 09:58:08'!
test09DirectionAndPositionLogIsCorrectWhenMarsRoverMovesForwardAndTurnRigth

	
	self assertLogs: DirectionLog and: PositionLog ForRoverStartingAt:0@0 heading:#North afterProcessing: 'fr' isOfSize: 2 andRegister: (OrderedCollection with:'0@1' with:'Este').
	
	
	
	! !


!TestLog methodsFor: 'assertions' stamp: 'TP 7/22/2021 09:49:51'!
assertLog: aLog ForRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands isOfSize: aNumber andRegister:aCollectionOfStrings

	
	| aMarsRover positionLog |
	aMarsRover := MarsRover startingAt: aPosition heading: aCardinalPoint .
	positionLog:= aLog new.
	aMarsRover addService: positionLog.
	aMarsRover processCommands: aStringOfCommands .
	
	
	self assert: aNumber equals: aMarsRover firstManager size.
	self assert: aCollectionOfStrings equals: aMarsRover firstManager log .
	! !

!TestLog methodsFor: 'assertions' stamp: 'TP 7/22/2021 09:54:59'!
assertLogs: aFirstLog and: aSecondLog ForRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands isOfSize: aNumber andRegister:aCollectionOfStrings

	| aMarsRover positionLog directionLog |
	aMarsRover := MarsRover startingAt: aPosition heading: aCardinalPoint .
	positionLog:= aFirstLog new.
	directionLog:=aSecondLog new.
	aMarsRover addService: positionLog.
	aMarsRover addService: directionLog.
	aMarsRover processCommands: aStringOfCommands .
	
	
	self assert: aNumber equals: aMarsRover firstManager size.
	self assert: aCollectionOfStrings equals: aMarsRover firstManager log .! !


!classDefinition: #TestMarsRover category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

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


!classDefinition: #TestWindow category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestWindow methodsFor: 'tdd test' stamp: 'TP 7/22/2021 10:15:30'!
test01PositionWindowIsCorrect
	
	
	self assertWindow: PositionWindow forRoverStartingAt:0@0 heading:#North afterProcessing: 'f' is: ' 0@1'.
! !

!TestWindow methodsFor: 'tdd test' stamp: 'TP 7/22/2021 10:15:30'!
test02DirectionWindowIsCorrect
	
	
	self assertWindow:DirectionWindow forRoverStartingAt:0@0 heading:#North afterProcessing: 'r' is: ' Este'.
! !

!TestWindow methodsFor: 'tdd test' stamp: 'TP 7/22/2021 10:15:19'!
test03WindowWithPositionAndDirectionIsCorrect
		
	
	self assertWindows:PositionWindow and:DirectionWindow forRoverStartingAt:0@0 heading:#North afterProcessing: 'fr' is: ' 0@1 Este'.
! !


!TestWindow methodsFor: 'assertions' stamp: 'TP 7/22/2021 10:15:30'!
assertWindow: aWindow forRoverStartingAt:aPosition heading:aCardinalPoint afterProcessing: aStringOfCommands is: aString


	| aMarsRover |
	aMarsRover := MarsRover startingAt: aPosition heading: aCardinalPoint .
	
	aMarsRover addService: aWindow new.
	aMarsRover processCommands: aStringOfCommands .
	
	self assert: aString  equals: aMarsRover firstManager visualize .
	
	! !

!TestWindow methodsFor: 'assertions' stamp: 'TP 7/22/2021 10:15:19'!
assertWindows: aFirstWindow and:aSecondWindow forRoverStartingAt:aPosition heading:aCardinalPoint afterProcessing: aStringOfCommands is: aString


	| aMarsRover |
	aMarsRover := MarsRover startingAt: aPosition heading: aCardinalPoint .
	
	aMarsRover addService: aFirstWindow new.
	aMarsRover addService: aSecondWindow new.
	aMarsRover processCommands: aStringOfCommands .
	
	self assert: aString  equals: aMarsRover firstManager visualize .! !


!classDefinition: #MarsRover category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head logManager windowManager managers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

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


!MarsRover methodsFor: 'testing' stamp: 'TP 7/22/2021 09:45:07'!
firstManager

	^managers first.

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


!MarsRover methodsFor: 'private - updateServices' stamp: 'TP 7/22/2021 09:42:53'!
update
	
	
	managers do:[:aManager| aManager updateWithNewChangesOf: self].
	! !


!MarsRover methodsFor: 'adding' stamp: 'TP 7/21/2021 19:56:43'!
addService: anElementOfService

	| managerOfTheService |
	managerOfTheService:=managers detect:[:aManager| aManager isKindOf: anElementOfService manager] 
	ifNone:[managers add:(anElementOfService manager new)].
	
	
	managerOfTheService add: anElementOfService .
	anElementOfService setForAMarsRover:self.! !


!MarsRover methodsFor: 'accessing' stamp: 'TP 7/22/2021 10:32:46'!
direction
	
	^head.! !

!MarsRover methodsFor: 'accessing' stamp: 'TP 7/21/2021 19:49:10'!
managers

	^managers.! !

!MarsRover methodsFor: 'accessing' stamp: 'TP 7/20/2021 18:32:01'!
position

	^position.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-ElRegreso'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

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

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-ElRegreso'!
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


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:30:45'!
nameForService: aService

	^ aService structureForEast.! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:30:36'!
nameForService: aService

	^ aService structureForNorth.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:30:24'!
nameForService: aService

	^ aService structureForSouth.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:30:09'!
nameForService: aService

	^ aService structureForWest.
	
	! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #ServiceManager category: 'MarsRover-ElRegreso'!
Object subclass: #ServiceManager
	instanceVariableNames: 'services'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!ServiceManager methodsFor: 'accessing' stamp: 'TP 7/22/2021 10:21:33'!
add: aTypeOfService

	services add: aTypeOfService! !


!ServiceManager methodsFor: 'initialization' stamp: 'TP 7/22/2021 10:22:03'!
initialize

	services:= OrderedCollection new.! !


!ServiceManager methodsFor: 'private' stamp: 'TP 7/22/2021 10:23:11'!
updateWithNewChangesOf: aMarsRover

	self subclassResponsibility .! !


!classDefinition: #LogManager category: 'MarsRover-ElRegreso'!
ServiceManager subclass: #LogManager
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!LogManager methodsFor: 'accessing' stamp: 'TP 7/21/2021 18:49:52'!
log

	^ self combineInUniqueLog.! !

!LogManager methodsFor: 'accessing' stamp: 'TP 7/22/2021 09:46:12'!
size

	^self combineInUniqueLog size.! !



!LogManager methodsFor: 'private' stamp: 'TP 7/22/2021 10:19:36'!
combineInUniqueLog

	| uniqueLog |
	uniqueLog:= OrderedCollection new.
	1 to: services first numberOfMovements do:[:index|
	services do:[:aLog| (aLog log) at: index ifPresent:[:value|uniqueLog add: value]]].

	^uniqueLog.! !

!LogManager methodsFor: 'private' stamp: 'TP 7/22/2021 10:19:35'!
updateWithNewChangesOf: aMarsRover

	services do: [:aLog| aLog registerANewMovementOf: aMarsRover ].! !


!classDefinition: #WindowManager category: 'MarsRover-ElRegreso'!
ServiceManager subclass: #WindowManager
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!


!WindowManager methodsFor: 'accessing' stamp: 'TP 7/22/2021 10:19:25'!
visualize

	^services inject: '' into:[:currentResult :aTypeOfWindow| aTypeOfWindow addStateFrom:currentResult ].! !


!WindowManager methodsFor: 'private' stamp: 'TP 7/22/2021 10:19:25'!
updateWithNewChangesOf: aMarsRover
	
	services do:[:aTypeOfWindow| aTypeOfWindow updateWith: aMarsRover ].

	! !


!classDefinition: #TypeOfLogs category: 'MarsRover-ElRegreso'!
Object subclass: #TypeOfLogs
	instanceVariableNames: 'dictionary lastEntry numberOfMovements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

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


!classDefinition: #DirectionLog category: 'MarsRover-ElRegreso'!
TypeOfLogs subclass: #DirectionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:34:25'!
registerANewMovementOf: aMarsRover
	
	| newDirection |
	newDirection:=(aMarsRover direction) nameForService:self.
	(newDirection=lastEntry) ifFalse: [
		dictionary add: (Association key: numberOfMovements value: newDirection) .
		lastEntry := newDirection ].
	
	numberOfMovements := numberOfMovements +1.
	! !

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:27:40'!
setForAMarsRover:aMarsRover

	lastEntry:= (aMarsRover direction) nameForService: self.
! !

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:31:46'!
structureForEast

	^'Este'! !

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:32:03'!
structureForNorth

	^'Norte'! !

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:31:56'!
structureForSouth

	^'Sur'! !

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:32:09'!
structureForWest

	^'Oeste'! !


!classDefinition: #PositionLog category: 'MarsRover-ElRegreso'!
TypeOfLogs subclass: #PositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

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


!classDefinition: #TypeOfWindow category: 'MarsRover-ElRegreso'!
Object subclass: #TypeOfWindow
	instanceVariableNames: 'observedVariable'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

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


!classDefinition: #DirectionWindow category: 'MarsRover-ElRegreso'!
TypeOfWindow subclass: #DirectionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!DirectionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:12:08'!
addStateFrom:currentResult

	^ currentResult,' ',observedVariable .! !

!DirectionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:35:55'!
structureForEast

	^'Este'! !

!DirectionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:36:20'!
structureForNorth

	^'Norte'! !

!DirectionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:36:00'!
structureForSouth

	^'Sur'! !

!DirectionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:36:24'!
structureForWest

	^'Oeste'! !

!DirectionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/22/2021 10:35:31'!
updateWith: aMarsRover

	observedVariable := aMarsRover direction nameForService: self.! !


!classDefinition: #PositionWindow category: 'MarsRover-ElRegreso'!
TypeOfWindow subclass: #PositionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!PositionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:36:45'!
addStateFrom:currentResult

	^ currentResult,' ',observedVariable printString .! !

!PositionWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/21/2021 17:27:38'!
updateWith: aMarsRover

	observedVariable := aMarsRover position.! !
