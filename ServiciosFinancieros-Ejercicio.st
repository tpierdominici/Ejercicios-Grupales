!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolio anAccount otherAccount otherPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:59:35'!
setUp
	portfolio _ Portfolio new.
	otherPortfolio _ Portfolio new.
	anAccount _ ReceptiveAccount new.
	otherAccount _ ReceptiveAccount new.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:58:07'!
test01WithdrawDecreasesBalanceOfSenderAccountAndIncreasesBalanceOfReceiverAccount
	portfolio add: anAccount.
	portfolio add: otherAccount.
	Deposit
		register: 100 * peso
		on: anAccount.
	Deposit
		register: 300 * peso
		on: otherAccount.
	self
		assert: 400 * peso
		equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 20:04:21'!
test02TransactionsOfPortfolioAreTheTransactionsOfAllItsAccounts
	portfolio add: anAccount.
	portfolio add: otherAccount.
	Deposit
		register: 300 * peso
		on: otherAccount.
	Withdraw
		register: 100 * peso
		on: otherAccount.
	Deposit
		register: 200 * peso
		on: anAccount.
	self assert: 3 equals: (portfolio transactions) size.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:58:42'!
test03PortfolioWithAccountsWithoutTransactionsDoesNotHaveTransactions
	portfolio add: anAccount .
	portfolio add: otherAccount.
	self assert: portfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 20:05:00'!
test04PortfolioKnowsTransactionsOfItsAccounts
	portfolio add: anAccount.
	portfolio add: otherAccount.
	Deposit
		register: 200 * peso
		on: anAccount.
	self assert: (portfolio seeTransactionsOf: otherAccount) isEmpty.
	self assert: 1 equals: (portfolio seeTransactionsOf: anAccount) size.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:56:03'!
test05BalanceOfEmptyPortfolioIsZero
	
	self assert: portfolio balance isZero.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:56:20'!
test06EmptyPortfolioDoesNotHaveTransactions
	self assert: portfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 20:00:04'!
test07TransactionOfPortfolioThatHasOnlyAnEmptyPortfolioAreZero
	portfolio add: otherPortfolio.
	self assert: portfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 20:00:18'!
test08BalanceOfPortfolioThatHasOnlyAnEmptyPortfolioIsZero
	portfolio add: otherPortfolio.
	self assert: portfolio balance isZero.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 17:12:45'!
test09PortfolioCanNotMakeTransactions
	self
		should: [
			Deposit
				register: 2000 * peso
				on: portfolio ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: Portfolio portfolioCannotRegisterATransactionErrorDescription ].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 20:03:29'!
test10BalanceOfPortfolioWithANonEmptyPortfolioIsTheSumOfAccountsBalancesInTheContainedPortfolio
	portfolio add: otherPortfolio.
	otherPortfolio add: anAccount.
	Deposit
		register: 200 * peso
		on: anAccount.
	self
		assert: 200 * peso
		equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 20:02:19'!
test11BalaceOfNonEmptyPortfolioIsTheSumOfItsFinancialContractsBalance
	portfolio add: otherPortfolio ..
	otherPortfolio add: anAccount.
	portfolio add: otherAccount.
	Deposit
		register: 200 * peso
		on: anAccount.
	Deposit
		register: 400 * peso
		on: otherAccount.
	self
		assert: 2
		equals: portfolio transactions size.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 20:03:08'!
test12PortfolioKnowsTransactionsOfItsNonEmptyPortfolio
	portfolio add: otherPortfolio .
	otherPortfolio add: anAccount .
	portfolio add: otherAccount .
	Deposit
		register: 300 * peso
		on: anAccount .
	Withdraw
		register: 100 * peso
		on: anAccount .
	Deposit
		register: 400 * peso
		on: otherAccount .
	self
		assert: 2
		equals: (portfolio seeTransactionsOf: otherPortfolio ) size.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:17:33'!
test13PortfolioCanNotHaveTwoAccountsEqualsErrorDescription
	portfolio add: anAccount.
	self
		should: [ portfolio add: anAccount ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: Portfolio portfolioCanNotHaveTwoAccountsEqualsErrorDescription ].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:19:44'!
test14PortfolioCanNotAddAnAccountAlreadyAddedInAnIncludedPortfolio
	portfolio add: otherPortfolio.
	otherPortfolio add: anAccount.
	self
		should: [ portfolio add: anAccount ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: Portfolio portfolioCanNotHaveTwoAccountsEqualsErrorDescription ].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:22:49'!
test15PortfolioShouldNotAddItSelf
	self
		should: [ portfolio add: portfolio ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: Portfolio portfolioCanNotAddItselfErrorDescription ].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:40:30'!
test16PortfolioCanNotAddAnAccountThatPortfolioFatherHas
	portfolio add: anAccount.
	portfolio add: otherPortfolio.
	self
		should: [ otherPortfolio add: anAccount ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: Portfolio portfolioCanNotHaveTwoAccountsEqualsErrorDescription ].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:53:39'!
test17PortfolioCanNotAddAPortfolioWithAnAccountAlreadyIncludedInFirstPortfolio
	portfolio add: anAccount.
	otherPortfolio add: anAccount.
	self
		should: [ portfolio add: otherPortfolio ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: Portfolio portfolioCanNotHaveTwoAccountsEqualsErrorDescription ].! !


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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'receiverAccount senderAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:44:14'!
setUp
	receiverAccount _ ReceptiveAccount new.
	senderAccount _ ReceptiveAccount new.
	
	Deposit register: 100 * peso on: senderAccount .! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:44:19'!
test01TransferDecreasesBalanceOfSenderAccountAndIncreasesBalanceOfReceiverAccount
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

!TransferTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:44:24'!
test02CannotTransferBiggerAmountThanSenderAccountsBalance
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
				equals: Transfer transferenciaErrorDescription ].! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 20:06:19'!
test03OnePartOfTheTransferKnowsItsCounterpart
	| collectionOfTransferParts depositPart withdrawPart |
	collectionOfTransferParts _ Transfer
		register: 100 * peso
		on: receiverAccount
		from: senderAccount.
	depositPart _ collectionOfTransferParts first.
	withdrawPart _ collectionOfTransferParts last.
	self assert: depositPart counterpart equals: withdrawPart.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'mg 7/5/2021 19:39:06'!
effectOnBalance: aBalance
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'initialization' stamp: 'TP 7/7/2021 18:55:34'!
initializeFor: aValue

	value := aValue ! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'private' stamp: 'mg 7/5/2021 19:38:18'!
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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'private' stamp: 'mg 7/5/2021 19:38:46'!
effectOnBalance: aBalance
	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'mg 7/5/2021 19:39:13'!
for: aValue
	^ self new initializeFor: aValue.! !


!classDefinition: #FinancialContract category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinancialContract
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!FinancialContract methodsFor: 'private' stamp: 'mg 7/7/2021 14:54:11'!
effectOnPortfolio: aPortfolioBalance
	^ self balance + aPortfolioBalance.! !


!FinancialContract methodsFor: 'main protocol' stamp: 'mg 7/7/2021 14:56:00'!
balance
	self subclassResponsibility.! !

!FinancialContract methodsFor: 'main protocol' stamp: 'mg 7/7/2021 15:03:27'!
register: aTransaction
	self subclassResponsibility.! !

!FinancialContract methodsFor: 'main protocol' stamp: 'mg 7/7/2021 14:57:24'!
transactions
	self subclassResponsibility.! !


!FinancialContract methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:33:25'!
beAddedTo: aCollectionOfFinancialContracts withFather: fatherPortfolio
	
	self subclassResponsibility .! !

!FinancialContract methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:44:28'!
checkIfThisFinancialContractCanNotBeAdded: aFinancialContract

	self subclassResponsibility .! !

!FinancialContract methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:51:37'!
haveAnyFinancialContractInCommonWith: aCollecionOfFinancialContracts

	self subclassResponsibility .! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
FinancialContract subclass: #Portfolio
	instanceVariableNames: 'financialContracts father'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'TP 7/8/2021 18:49:25'!
add: aFinancialContract
	| thisCanNotBeAdded |
	aFinancialContract haveAnyFinancialContractInCommonWith: financialContracts .
	self = aFinancialContract ifTrue: [ self error: self class portfolioCanNotAddItselfErrorDescription ].
	thisCanNotBeAdded _ father checkIfThisFinancialContractCanNotBeAdded: aFinancialContract.
	thisCanNotBeAdded ifFalse: [ ^ aFinancialContract
			beAddedTo: financialContracts
			withFather: self ].
	aFinancialContract
		beAddedTo: financialContracts
		withFather: self.
	^ self error: Portfolio portfolioCanNotHaveTwoAccountsEqualsErrorDescription.! !

!Portfolio methodsFor: 'main protocol' stamp: 'mg 7/7/2021 15:53:29'!
balance
	financialContracts isEmpty ifTrue: [ ^ 0 * peso ].
	^ financialContracts
		inject: 0 * peso
		into: [ :currentBalance :aFinancialContract |
			aFinancialContract effectOnPortfolio: currentBalance ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'TP 7/8/2021 17:12:45'!
register: aTransaction
	^ self error: self class portfolioCannotRegisterATransactionErrorDescription.! !

!Portfolio methodsFor: 'main protocol' stamp: 'mg 7/7/2021 15:52:20'!
seeTransactionsOf: aFinancialContract
	| index |
	index _ financialContracts find: aFinancialContract.
	^ (financialContracts at: index) transactions.! !

!Portfolio methodsFor: 'main protocol' stamp: 'mg 7/7/2021 15:52:20'!
transactions
	| transactions |
	transactions _ OrderedCollection new.
	1
		to: financialContracts size
		do: [ :index |
			transactions addAllLast: (financialContracts at: index) transactions ].
	^ transactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'TP 7/8/2021 18:35:02'!
initialize
	financialContracts _ OrderedCollection new.
	father:= self.! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:32:35'!
beAddedTo: aCollectionOfFinancialContracts withFather: fatherPortfolio
	father _ fatherPortfolio.
	aCollectionOfFinancialContracts addFirst: self.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:44:29'!
checkIfThisFinancialContractCanNotBeAdded: aFinancialContract
	 financialContracts
		detect: [ :anIncludedFinancialContract |
			anIncludedFinancialContract checkIfThisFinancialContractCanNotBeAdded: aFinancialContract ]
		ifNone: [ ^ false ].
		^true.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:50:42'!
haveAnyFinancialContractInCommonWith: aCollecionOfFinancialContracts
	
	(aCollecionOfFinancialContracts includesAnyOf: financialContracts) ifTrue: [^self error: self class portfolioCanNotHaveTwoAccountsEqualsErrorDescription ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 17:36:09'!
thisCollection: collectionOfFinancialContracts has: aFinancialContract

	"1 to: financialContracts size do: [:index| 
		(financialContracts at: index) XXX: aFinancialContract
		]."
	
	collectionOfFinancialContracts detect: [:variable| variable XXX: aFinancialContract ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:20:39'!
portfolioCanNotAddItselfErrorDescription

	^'No se puede añadir a si mismo'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 17:12:27'!
portfolioCanNotHaveTwoAccountsEqualsErrorDescription

	^'Un portafolio no puede tener cuentas iguales.'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 17:13:09'!
portfolioCannotRegisterATransactionErrorDescription
	^ 'Un portafolio no puede registrar una transaccion'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
FinancialContract subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mg 7/7/2021 14:56:41'!
balance
	^ transactions
		inject: 0 * peso
		into: [ :currentBalance :aTransaction |
			aTransaction effectOnBalance: currentBalance].! !

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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:33:09'!
beAddedTo: aCollectionOfFinancialContracts withFather: fatherPortfolio
	aCollectionOfFinancialContracts addFirst: self.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:44:28'!
checkIfThisFinancialContractCanNotBeAdded: aFinancialContract
	^ self = aFinancialContract.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'TP 7/8/2021 18:51:27'!
haveAnyFinancialContractInCommonWith: aCollecionOfFinancialContracts

	! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'TP 7/7/2021 19:24:53'!
initializeFor: aValue
	self subclassResponsibility .! !


!Transfer methodsFor: 'private' stamp: 'mg 7/5/2021 19:41:21'!
effectOnBalance: aBalance
	^ self value + aBalance.! !

!Transfer methodsFor: 'private' stamp: 'mg 7/5/2021 11:03:56'!
value
	^ value.! !


!Transfer methodsFor: 'main protocol' stamp: 'mg 7/7/2021 15:18:04'!
counterpart
	^ counterpart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:20:54'!
for: aValue
	^ self new initializeFor: aValue.
	! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:49:36'!
register: aValue on: receiverAccount from: senderAccount
	| depositPart collectionOfTransferParts |
	senderAccount balance < aValue ifTrue: [ self error: Transfer transferenciaErrorDescription ].
	depositPart _ DepositPart for: aValue.
	collectionOfTransferParts _ OrderedCollection
		with: depositPart
		with: depositPart counterpart.
	senderAccount register: depositPart counterpart.
	receiverAccount register: depositPart.
	^ collectionOfTransferParts.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:02:37'!
transferenciaErrorDescription
	^ 'error'.! !


!classDefinition: #DepositPart category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #DepositPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositPart methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:22:33'!
initializeFor: aValue
	| withdrawPart |
	value _ aValue.
	withdrawPart _ WithdrawPart for: aValue negated.
	counterpart _ withdrawPart.
	withdrawPart counterpart: self.! !


!classDefinition: #WithdrawPart category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #WithdrawPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawPart methodsFor: 'initialization' stamp: 'TP 7/7/2021 19:24:29'!
initializeFor: aValue
	
	value _ aValue.! !


!WithdrawPart methodsFor: 'as yet unclassified' stamp: 'TP 7/7/2021 19:23:17'!
counterpart: aDepositPart

	counterpart := aDepositPart .! !
