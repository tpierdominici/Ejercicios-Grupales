!classDefinition: #TestLog category: 'MarsRover-Solucion'!
TestCase subclass: #TestLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:50:18'!
test01

	| aMarsRover positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	positionLog:= PositionLog new.
	aMarsRover addNewLog: positionLog .
	aMarsRover processCommands: ''.
	
	
	self assert: 0 equals: (positionLog size).
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:49:09'!
test02

	| aMarsRover positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	positionLog:= PositionLog new.
	aMarsRover addNewLog: positionLog.
	aMarsRover processCommands: 'f'.
	
	
	self assert: 1 equals: positionLog size.
	self assert: '0@1' equals: positionLog first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:49:39'!
test03

	| aMarsRover positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	positionLog:= PositionLog new.
	aMarsRover addNewLog: positionLog.
	aMarsRover processCommands: 'b'.
	
	
	self assert: 1 equals: positionLog size.
	self assert: '0@-1' equals: positionLog first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:55:12'!
test04

	| aMarsRover directionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	directionLog:= DirectionLog new.
	aMarsRover addNewLog: directionLog.
	aMarsRover processCommands: 'r'.
	
	
	self assert: 1 equals: directionLog size.
	self assert: 'Este' equals: directionLog first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:55:30'!
test05

	| aMarsRover directionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	directionLog:= DirectionLog new.
	aMarsRover addNewLog: directionLog.
	aMarsRover processCommands: 'l'.
	
	
	self assert: 1 equals: directionLog size.
	self assert: 'Oeste' equals: directionLog first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:55:55'!
test06

	| aMarsRover directionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	directionLog:= DirectionLog new.
	aMarsRover addNewLog: directionLog.
	aMarsRover processCommands: 'r'.
	
	
	self assert: 1 equals: directionLog size.
	self assert: 'Este' equals: directionLog first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:57:37'!
test07

	| aMarsRover directionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #East.
	directionLog:= DirectionLog new.
	aMarsRover addNewLog: directionLog.
	aMarsRover processCommands: 'l'.
	
	
	self assert: 1 equals: directionLog size.
	self assert: 'Norte' equals: directionLog first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:01:43'!
test08

	| aMarsRover directionLog positionLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #East.
	directionLog:= DirectionLog new.
	positionLog:= PositionLog new.
	aMarsRover addNewLog: directionLog.
	aMarsRover addNewLog: positionLog.
	aMarsRover processCommands: 'f'.
	
	self assert: 1 equals: positionLog size.
	self assert: '1@0' equals: positionLog first .
	
	
	! !

!TestLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:45:26'!
test09

	| aMarsRover  generalLog |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	generalLog:= GeneralLog new.
	
	aMarsRover addNewLog: generalLog.
	aMarsRover processCommands: 'fr'.
	
	self assert: 2 equals: generalLog size.
	self assert: (OrderedCollection with: '0@1' with:'Este') equals: generalLog log .
	
	
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

!TestWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 09:47:02'!
test01
	| aMarsRover |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	
	aMarsRover activatePositionWindow.
	aMarsRover processCommands: ''.
	
	self assert: '0@0' equals: (aMarsRover window) visualize .
! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 09:47:29'!
test02
	| aMarsRover |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	
	aMarsRover activatePositionWindow.
	aMarsRover processCommands: 'f'.
	
	self assert: '0@1' equals: (aMarsRover window) visualize .
! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 09:54:53'!
test03
	| aMarsRover |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	
	aMarsRover activateDireccionWindow.
	aMarsRover processCommands: ''.
	
	self assert: 'Norte' equals: (aMarsRover window) visualize .
! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 10:04:35'!
test04
	| aMarsRover |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	
	aMarsRover activateDireccionWindow.
	aMarsRover activatePositionWindow .
	aMarsRover processCommands: ''.
	
	self assert: '0@0 Norte' equals: (aMarsRover window) visualize .
! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 10:23:13'!
test05testing
	| aMarsRover |
	aMarsRover := MarsRover startingAt: 0@0 heading: #North.
	
	aMarsRover activateDireccionWindow.
	aMarsRover activatePositionWindow .
	aMarsRover activatePositionLog .
	aMarsRover activateDireccionLog .
	aMarsRover processCommands: 'fr'.
	
	self assert: '0@1 Este' equals: (aMarsRover window) visualize .
	self assert: (OrderedCollection with: '0@1' with: 'Este') equals: aMarsRover log.
! !


!classDefinition: #GeneralLog category: 'MarsRover-Solucion'!
Object subclass: #GeneralLog
	instanceVariableNames: 'collectionOfEntries logs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!GeneralLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:49:55'!
add: aLog

	logs add: aLog.! !

!GeneralLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:49:32'!
initialize

	logs:= OrderedCollection new.
	collectionOfEntries:=OrderedCollection new.
! !

!GeneralLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:52:10'!
updateFor: aMarsRover

	logs do: [:aLog| aLog registerANewMovementOf: self].! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head positionLog direccionLog log direccionWindow positionWindow logs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'TP 7/20/2021 18:46:14'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	logs:=nil.
	positionLog := false.
	direccionLog := false.
	direccionWindow := false.
	positionWindow := false.
	
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


!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 09:34:59'!
activateDireccionLog
	log ifNil:[log:=OrderedCollection new.].
	direccionLog:=true.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 10:00:52'!
activateDireccionWindow
	direccionWindow:= true.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 09:29:50'!
activatePositionLog
	log ifNil:[log:=OrderedCollection new.].
	positionLog:=true.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 10:15:25'!
activatePositionWindow
	positionWindow:= true.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:46:56'!
addNewLog: aTypeOfLog
	logs ifNil:[logs:=OrderedCollection new].
	logs add: aTypeOfLog .
	aTypeOfLog setForAMarsRover:self.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:51:44'!
direction
	
	^head nameForLog .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 09:33:23'!
log
	^log.
	
	
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:32:01'!
position

	^position.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 09:51:59'!
registerNewDireccion

	direccionLog ifTrue: [log add:(head nameForLog ) ].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:51:51'!
update

	log updateFor: self.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 10:18:47'!
visualize
	| finalResult |
	finalResult:=''.
	positionWindow ifTrue:[finalResult := position printString ].
	direccionWindow ifTrue: [
		(finalResult ='') ifTrue: [^head nameForLog].
		finalResult:= finalResult,' ',head nameForLog ].
	^finalResult .
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 09:45:31'!
window
	self! !

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
	instanceVariableNames: 'collection lastEntry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:28:47'!
add: newEntry

	collection add: newEntry .! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:44:35'!
first

	^collection first.! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:47:50'!
initialize

	collection:= OrderedCollection new.
	! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:11:32'!
log
	
	^collection.! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 10:55:28'!
registerANewMovementOf: aMarsRover

	self subclassResponsibility .! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:44:41'!
second

	^collection second.! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:36:36'!
setForAMarsRover:aMarsRover

	self subclassResponsibility .! !

!TypeOfLogs methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:16:13'!
size

	^self log size.! !


!classDefinition: #DirectionLog category: 'MarsRover-Solucion'!
TypeOfLogs subclass: #DirectionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:32:55'!
log
	^super log.! !

!DirectionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:28:22'!
registerANewMovementOf: aMarsRover
	
	| newDirection |
	newDirection:=aMarsRover direction.
	(newDirection=lastEntry) ifFalse: [
		super add: newDirection .
		lastEntry := newDirection ].! !

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

!PositionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:32:50'!
log
	
	^super log.! !

!PositionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 19:29:02'!
registerANewMovementOf: aMarsRover
	
	| newPosition |
	newPosition:=aMarsRover position.
	(newPosition=lastEntry) ifFalse: [
		super add: newPosition printString.
		lastEntry := newPosition ].
	
	
	! !

!PositionLog methodsFor: 'as yet unclassified' stamp: 'TP 7/20/2021 18:31:42'!
setForAMarsRover:aMarsRover

	lastEntry:= aMarsRover position.
! !
