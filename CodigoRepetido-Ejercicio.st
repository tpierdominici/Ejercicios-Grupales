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

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/20/2021 15:27:20'!
test03CanNotAddACustomerWithEmptyName
	| customerBook addingAnEmptyName |
	customerBook _ CustomerBook new.
	addingAnEmptyName _ [
	customerBook addCustomerNamed: ''.
	self fail ].
	self
		whenThisActionFails: addingAnEmptyName
		checkThis: [ :anError |
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/20/2021 15:27:26'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon removingAnInvalidCustomer |
	johnLennon _ 'John Lennon'.
	customerBook _ self createCustomerBookWithACustomer: johnLennon.
	removingAnInvalidCustomer _ [
	customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ].
	self
		whenThisActionFails: removingAnInvalidCustomer
		checkThis: [ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/20/2021 15:38:23'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney |
	customerBook _ CustomerBook new.
	paulMcCartney _ 'Paul McCartney'.
	self
		addSuspendOrAndRemoveCustomer: paulMcCartney
		remove: false
		book: customerBook.
	self
		checkActiveCustomer: 0
		suspended: 1
		total: 1
		book: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/20/2021 15:38:33'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook paulMcCartney |
	customerBook _ CustomerBook new.
	paulMcCartney _ 'Paul McCartney'.
	self
		addSuspendOrAndRemoveCustomer: paulMcCartney
		remove: true
		book: customerBook.
	self
		checkActiveCustomer: 0
		suspended: 0
		total: 0
		book: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/20/2021 15:37:18'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook johnLennon |
	johnLennon _ 'John Lennon'.
	customerBook _ self createCustomerBookWithACustomer: johnLennon.
	self
		cantSuspendCustomer: 'Ringo Starr'
		book: customerBook.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TP 5/20/2021 15:37:23'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| customerBook johnLennon |
	johnLennon _ 'John Lennon'.
	customerBook _ self createCustomerBookWithACustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	self
		cantSuspendCustomer: johnLennon
		book: customerBook.! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'mg 5/17/2021 11:51:08'!
addSuspendOrAndRemoveCustomer: aName remove: boolean book: customerBook
	| customerName |
	customerName _ aName.
	customerBook addCustomerNamed: aName.
	customerBook suspendCustomerNamed: aName.
	boolean ifTrue: [customerBook removeCustomerNamed:customerName].! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'TP 5/20/2021 15:37:05'!
cantSuspendCustomer: aName book: customerBook
	[
	customerBook suspendCustomerNamed: aName.
	self fail ]
		on: CantSuspend
		do: [ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ].! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'TP 5/20/2021 15:37:58'!
checkActiveCustomer: cantActive suspended: cantSuspended total: allCustomers book: customerBook
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

!CustomerBookTest methodsFor: 'helpers' stamp: 'TP 5/20/2021 15:27:06'!
whenThisActionFails: deniedAction checkThis: consequences
	deniedAction
		on: Error
		do: consequences.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookTest class' category: 'CodigoRepetido-Ejercicio'!
CustomerBookTest class
	instanceVariableNames: 'customerBook'!


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

!CustomerBook methodsFor: 'customer management' stamp: 'TP 5/20/2021 15:12:01'!
removeCustomerNamed: aName
	(self includesCustomerNamed: aName) ifFalse: [ ^ NotFound signal ].
	(active includes:aName) ifTrue: [active remove: aName] ifFalse: [suspended remove: aName].
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
