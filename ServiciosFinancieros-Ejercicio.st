!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 21:02:32'!
test01
	| portfolio account1 account2 accounts |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	accounts _ OrderedCollection
		with: account1
		with: account2.
	portfolio _ Portfolio for: accounts.
	Deposit
		register: 100 * peso
		on: account1.
	Deposit
		register: 300 * peso
		on: account2.
	self
		assert: 400 * peso
		equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 21:16:47'!
test02
	| portfolio account1 account2 accounts |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	accounts _ OrderedCollection
		with: account1
		with: account2.
	portfolio _ Portfolio for: accounts.
	Deposit
		register: 300 * peso
		on: account2.
	self deny: portfolio seeAllTransactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 21:17:57'!
test03
	| portfolio account1 account2 accounts |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	accounts _ OrderedCollection
		with: account1
		with: account2.
	portfolio _ Portfolio for: accounts.
	Deposit
		register: 300 * peso
		on: account2.
	Withdraw
		register: 100 * peso
		on: account2.
	Deposit
		register: 200 * peso
		on: account1.
	self assert: portfolio seeAllTransactions size = 3.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 21:19:13'!
test04
	| portfolio account1 account2 accounts |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	accounts _ OrderedCollection
		with: account1
		with: account2.
	portfolio _ Portfolio for: accounts.
	self assert: portfolio seeAllTransactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 21:31:25'!
test05
	| portfolio account1 account2 accounts |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	accounts _ OrderedCollection
		with: account1
		with: account2.
	portfolio _ Portfolio for: accounts.
	Deposit
		register: 200 * peso
		on: account1.
	self assert: (portfolio seeTransactionsOf: account1) = 1.
	self assert: (portfolio seeTransactionsOf: account2) isEmpty.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mg 7/5/2021 10:07:22'!
test03WithdrawDecreasesBalanceOnTransactionValue
	| account |
	account _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: account.
	Withdraw
		register: 50 * peso
		on: account.
	self
		assert: 50 * peso
		equals: account balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mg 7/5/2021 20:16:46'!
test08
	| senderAccount receiverAccount |
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	Transfer
		register: 100 * peso
		on: receiverAccount from:senderAccount.
	self assert: 100 * peso equals: receiverAccount balance.
	self assert: 0 * peso equals: senderAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mg 7/5/2021 19:55:05'!
test09
	| senderAccount receiverAccount |
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	Deposit
		register: 200 * peso
		on: senderAccount.
	self
		should: [
			Transfer
				register: 2000 * peso
				on: receiverAccount
				from: senderAccount ]
		raise: Error
		withExceptionDo: [:anError | self
				assert: anError messageText
				equals:Transfer TransferenciaErrorDescription ].! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 20:17:05'!
test01
	| senderAccount receiverAccount |
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: senderAccount.
	Transfer
		register: 100 * peso
		on: receiverAccount
		from: senderAccount.
	self
		assert: 100 * peso
		equals: receiverAccount balance.
	self
		assert: 0 * peso
		equals: senderAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 20:17:22'!
test02
	| senderAccount receiverAccount |
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	Deposit
		register: 200 * peso
		on: senderAccount.
	self
		should: [
			Transfer
				register: 2000 * peso
				on: receiverAccount
				from: senderAccount ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: Transfer TransferenciaErrorDescription ].! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 19:39:06'!
effectOnBalance: aBalance
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 19:38:18'!
effectOnBalance: aBalance
	^ self value + aBalance.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 19:38:46'!
effectOnBalance: aBalance
	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'mg 7/5/2021 19:39:13'!
for: aValue
	^ self new initializeFor: aValue.! !



!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'orderedCollection accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 21:00:53'!
balance
	^ accounts
		inject: 0 * peso
		into: [ :currentBalance :anAccount |
			anAccount effectOnPortfolio: currentBalance ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 21:15:47'!
seeAllTransactions
	| transactions |
	transactions _ OrderedCollection new.
	1
		to: accounts size
		do: [ :index |
			transactions addAllLast: (accounts at: index) transactions ].
	^ transactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 21:28:34'!
seeTransactionsOf: aReceptiveAccount
	| index |
	index _ accounts find: aReceptiveAccount.
	^ (accounts at: index) transactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'mg 7/5/2021 20:53:39'!
initializeFor: anOrderedCollection 
	accounts := anOrderedCollection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 20:51:26'!
for: anOrderedCollection
	^ self new initializeFor: anOrderedCollection.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mg 7/5/2021 19:39:38'!
balance
	^ transactions
		inject: 0 * peso
		into: [ :currentBalance :aTransaction |
			aTransaction effectOnBalance: currentBalance ]"^ transactions
		sum: [ :aTransaction |
			aTransaction value ]
		ifEmpty: [ 0 ].".! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 20:59:42'!
effectOnPortfolio: aPortfolioBalance
	^ self balance + aPortfolioBalance.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 19:41:21'!
effectOnBalance: aBalance
	^ self value + aBalance.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 11:02:02'!
initializeFor: aValue
	value _ aValue.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 11:03:56'!
value
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 10:41:04'!
TransferenciaErrorDescription
	^ 'error'.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 11:01:15'!
for: aValue
	^ self new initializeFor: aValue.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 19:55:05'!
register: aValue on: receiverAccount from: senderAccount
	| transactionDeposit transactionWithdrawal |
	senderAccount balance < aValue ifTrue: [ self error: Transfer TransferenciaErrorDescription ].
	transactionWithdrawal _ self for: aValue negated.
	transactionDeposit _ self for: aValue.
	senderAccount register: transactionWithdrawal.
	receiverAccount register: transactionDeposit.
	^ OrderedCollection
		with: transactionDeposit
		with: transactionWithdrawal.! !
