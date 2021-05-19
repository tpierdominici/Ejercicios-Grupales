!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'new'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/19/2021 14:10:59'!
measureTime: aClosure 
	| millisecondsBeforeRunning millisecondsAfterRunning |
	millisecondsBeforeRunning _ Time millisecondClockValue * millisecond.
	aClosure.
	millisecondsAfterRunning _ Time millisecondClockValue * millisecond.
	^ millisecondsAfterRunning - millisecondsBeforeRunning.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mg 5/17/2021 10:54:20'!
measureTime: aClosure value: parameters
	| millisecondsBeforeRunning millisecondsAfterRunning |
	millisecondsBeforeRunning _ Time millisecondClockValue * millisecond.
	aClosure.
	millisecondsAfterRunning _ Time millisecondClockValue * millisecond.
	^ millisecondsAfterRunning - millisecondsBeforeRunning.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/19/2021 15:06:13'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook timeDifference |
	customerBook _ CustomerBook new.
	timeDifference _  [ customerBook addCustomerNamed: 'John Lennon' ] timeToRun.
	self assert: timeDifference < (50 * millisecond).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/19/2021 16:31:05'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook timeDifference paulMcCartney |
	paulMcCartney _ 'Paul McCartney'.
	customerBook:= self createCustomerBookWithACustomer: paulMcCartney .
	timeDifference _ [ customerBook removeCustomerNamed: paulMcCartney ] timeToRun.
	self assert: timeDifference < (100 * millisecond).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/19/2021 17:06:20'!
test03CanNotAddACustomerWithEmptyName
	| customerBook addingAnEmptyName |
	customerBook _ CustomerBook new.
	addingAnEmptyName _ [customerBook addCustomerNamed: ''.self fail ] .
	self WhenThisActionFails: addingAnEmptyName
		checkThis: [ :anError |
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/19/2021 17:09:28'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon removingAnInvalidCustomer|
	johnLennon _ 'John Lennon'.
	customerBook _ self createCustomerBookWithACustomer: johnLennon .
	removingAnInvalidCustomer _[customerBook removeCustomerNamed: 'Paul McCartney'.self fail ].
		self WhenThisActionFails: removingAnInvalidCustomer checkThis: [ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mg 5/17/2021 11:49:56'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney |
	customerBook _ CustomerBook new.
	paulMcCartney _ 'Paul McCartney'.
	self addSuspendOrAndRemoveCustomer:paulMcCartney remove:false book:customerBook.
	self checkCustomerType:0 suspended: 1 total: 1 book:customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mg 5/17/2021 11:41:50'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook paulMcCartney |
	customerBook _ CustomerBook new.
	paulMcCartney _ 'Paul McCartney'.
	self addSuspendOrAndRemoveCustomer:paulMcCartney remove:true book:customerBook.
	self
		checkCustomerType: 0
		suspended: 0
		total: 0
		book: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/19/2021 16:34:12'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook johnLennon |
	johnLennon _ 'John Lennon'.
	customerBook _ self createCustomerBookWithACustomer: johnLennon.
	self
		CantSuspendCustomer: 'Ringo Starr'
		in: customerBook.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/19/2021 16:34:02'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| customerBook johnLennon |
	johnLennon _ 'John Lennon'.
	customerBook _ self createCustomerBookWithACustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	self
		CantSuspendCustomer: johnLennon
		in: customerBook.! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'TP 5/19/2021 16:13:26'!
CantSuspendCustomer: aName in: customerBook 
	[
	customerBook suspendCustomerNamed: aName.
	self fail ]
		on: CantSuspend
		do: [ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ].! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'TP 5/19/2021 17:01:49'!
WhenThisActionFails: aBlockClosure  checkThis: aClosure
	aBlockClosure
		on: Error
		do: aClosure.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'mg 5/17/2021 11:51:08'!
addSuspendOrAndRemoveCustomer: aName remove: boolean book: customerBook
	| customerName |
	customerName _ aName.
	customerBook addCustomerNamed: aName.
	customerBook suspendCustomerNamed: aName.
	boolean ifTrue: [customerBook removeCustomerNamed:customerName].! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'mg 5/17/2021 11:23:43'!
checkCustomerType: cantActive suspended: cantSuspended total: allCustomers book: customerBook
	self
		assert: cantActive
		equals: customerBook numberOfActiveCustomers.
	self
		assert: cantSuspended
		equals: customerBook numberOfSuspendedCustomers.
	self
		assert: allCustomers
		equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'TP 5/19/2021 16:28:38'!
createCustomerBookWithACustomer: aCustomer

	|customerBook|
	customerBook _ CustomerBook new.
	customerBook addCustomerNamed: aCustomer .
	^ customerBook.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'TP 5/19/2021 15:37:43'!
whenError: aClosureA do: aClosureB
	 (aClosureA fail)
		on: Error
		do: aClosureB.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookTest class' category: 'CodigoRepetido-Ejercicio'!
CustomerBookTest class
	instanceVariableNames: 'customerBook'!


!classDefinition: #CustomerBookTestOriginal category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTestOriginal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTestOriginal methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:19'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook millisecondsBeforeRunning millisecondsAfterRunning |
	
	customerBook := CustomerBook new.
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: 'John Lennon'.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (50 * millisecond)
	
! !

!CustomerBookTestOriginal methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:13'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook millisecondsBeforeRunning millisecondsAfterRunning paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (100 * millisecond)
	
! !

!CustomerBookTestOriginal methodsFor: 'tests' stamp: 'TP 5/19/2021 15:46:16'!
test03CanNotAddACustomerWithEmptyName
	| customerBook |
	customerBook _ CustomerBook new.
	[
	customerBook addCustomerNamed: ''.
	self fail ]
		on: Error
		do: [ :anError |
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTestOriginal methodsFor: 'tests' stamp: 'TP 5/19/2021 15:26:27'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |
	customerBook _ CustomerBook new.
	johnLennon _ 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	[
	customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound
		do: [ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTestOriginal methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTestOriginal methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTestOriginal methodsFor: 'tests' stamp: 'NR 4/30/2020 09:08:46'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTestOriginal methodsFor: 'tests' stamp: 'NR 9/19/2018 17:57:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'TP 5/19/2021 17:23:24'!
addCustomerNamed: aName
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'TP 5/19/2021 18:25:54'!
removeCustomerNamed: aName
	(self includesCustomerNamed: aName) ifFalse: [ ^ NotFound signal ].
	self
		searchAndRemoveCustomer: aName
		In: active.
	self
		searchAndRemoveCustomer: aName
		In: suspended.
		
	^ aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'TP 5/19/2021 18:24:12'!
searchAndRemoveCustomer: aName In: ArrayType
	1
		to: ArrayType size
		do: [ :index |
			aName = (ArrayType at: index) ifTrue: [
				ArrayType removeAt: index.
				^ aName ]].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!classDefinition: #CustomerBookOriginal category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBookOriginal
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookOriginal methodsFor: 'initialization' stamp: 'TP 5/19/2021 17:15:02'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBookOriginal methodsFor: 'customer management' stamp: 'TP 5/19/2021 17:15:02'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBookOriginal methodsFor: 'customer management' stamp: 'TP 5/19/2021 17:15:02'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBookOriginal methodsFor: 'customer management' stamp: 'TP 5/19/2021 17:15:02'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBookOriginal methodsFor: 'accessing' stamp: 'TP 5/19/2021 17:15:02'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBookOriginal methodsFor: 'accessing' stamp: 'TP 5/19/2021 17:15:02'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBookOriginal methodsFor: 'accessing' stamp: 'TP 5/19/2021 17:15:02'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBookOriginal methodsFor: 'testing' stamp: 'TP 5/19/2021 17:15:02'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBookOriginal methodsFor: 'testing' stamp: 'TP 5/19/2021 17:15:02'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBookOriginal methodsFor: 'signal errors' stamp: 'TP 5/19/2021 17:15:02'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBookOriginal methodsFor: 'signal errors' stamp: 'TP 5/19/2021 17:15:02'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookOriginal class' category: 'CodigoRepetido-Ejercicio'!
CustomerBookOriginal class
	instanceVariableNames: ''!

!CustomerBookOriginal class methodsFor: 'error messages' stamp: 'TP 5/19/2021 17:15:02'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBookOriginal class methodsFor: 'error messages' stamp: 'TP 5/19/2021 17:15:02'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
