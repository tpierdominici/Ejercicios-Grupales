!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:56:54'!
test01WithdrawDecreasesBalanceOfSenderAccountAndIncreasesBalanceOfReceiverAccount
	| portfolio account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio add: account1.
	portfolio add: account2.
	Deposit
		register: 100 * peso
		on: account1.
	Deposit
		register: 300 * peso
		on: account2.
	self
		assert: 400 * peso
		equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:20:20'!
test02TransactionsOfPortfolioAreTheTransactionsOfAllItsAccounts
	| portfolio account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio add: account1.
	portfolio add: account2.
	Deposit
		register: 300 * peso
		on: account2.
	Withdraw
		register: 100 * peso
		on: account2.
	Deposit
		register: 200 * peso
		on: account1.
	self assert: portfolio transactions size = 3.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:24:48'!
test03PortfolioWithAccountsWithoutTransactionsDoesNotHaveTransactions
	| portfolio account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio add: account1.
	portfolio add: account2.
	self assert: portfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:26:33'!
test04PortfolioKnowsTransactionsOfItsAccounts
	| portfolio account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio add: account1.
	portfolio add: account2.
	Deposit
		register: 200 * peso
		on: account1.
	self assert: (portfolio seeTransactionsOf: account2) isEmpty.
	self assert: (portfolio seeTransactionsOf: account1) size = 1.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:27:20'!
test05BalanceOfEmptyPortfolioIsZero
	| portfolio |
	portfolio _ Portfolio new.
	self assert: portfolio balance isZero.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:28:00'!
test06EmptyPortfolioDoesNotHaveTransactions
	| portfolio |
	portfolio _ Portfolio new.
	self assert: portfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:31:06'!
test07TransactionOfPortfolioThatHasOnlyAnEmptyPortfolioAreZero
	| portfolio1 portfolio2 |
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio1 add:portfolio2.
	self assert: portfolio1 transactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:31:55'!
test08BalanceOfPortfolioThatHasOnlyAnEmptyPortfolioIsZero
	| portfolio1 portfolio2 |
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio1 add: portfolio2.
	self assert: portfolio1 balance isZero.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:32:37'!
test09PortfolioCanNotMakeTransactions
	| portfolio1 |
	portfolio1 _ Portfolio new.
	self
		should: [
			Deposit
				register: 2000 * peso
				on: portfolio1 ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: Portfolio PortfolioCannotRegisterATransactionErrorDescription ].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:37:48'!
test10BalanceOfPortfolioWithANonEmptyPortfolioIsTheSumOfAccountsBalancesInTheContainedPortfolio
	| portfolio1 portfolio2 account1 |
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio1 add: portfolio2.
	account1 _ ReceptiveAccount new.
	portfolio2 add: account1.
	Deposit
		register: 200 * peso
		on: account1.
	self
		assert: 200 * peso
		equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:40:19'!
test11BalaceOfNonEmptyPortfolioIsTheSumOfItsFinancialContractsBalance
	| portfolio1 portfolio2 account1 account2 |
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio1 add: portfolio2.
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio2 add: account1.
	portfolio1 add: account2.
	Deposit
		register: 200 * peso
		on: account1.
	Deposit
		register: 400 * peso
		on: account2.
	self
		assert: 2
		equals: portfolio1 transactions size.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:42:58'!
test12PortfolioKnowsTransactionsOfItsNonEmptyPortfolio
	| portfolio1 portfolio2 account1 account2 |
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio1 add: portfolio2.
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio2 add: account1.
	portfolio1 add: account2.
	Deposit
		register: 300 * peso
		on: account1.
	Withdraw
		register: 100 * peso
		on: account1.
	Deposit
		register: 400 * peso
		on: account2.
	self
		assert: 2
		equals: (portfolio1 seeTransactionsOf: portfolio2) size.! !


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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:57:11'!
test01TransferDecreasesBalanceOfSenderAccountAndIncreasesBalanceOfReceiverAccount
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

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:00:15'!
test02CannotTransferBiggerAmountThanSenderAccountsBalance
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

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 16:01:22'!
test03OnePartOfTheTransferKnowsItsCounterpart
	| senderAccount receiverAccount transfer |
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: senderAccount.
	transfer _ Transfer
		register: 100 * peso
		on: receiverAccount
		from: senderAccount.
	self assert:transfer first counterpart = transfer last.! !


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



!classDefinition: #FinancialContract category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinancialContract
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!FinancialContract methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 14:56:00'!
balance
	self subclassResponsibility.! !

!FinancialContract methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 14:54:11'!
effectOnPortfolio: aPortfolioBalance
	^ self balance + aPortfolioBalance.! !

!FinancialContract methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:03:27'!
register: aTransaction
	self subclassResponsibility.! !

!FinancialContract methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 14:57:24'!
transactions
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
FinancialContract subclass: #Portfolio
	instanceVariableNames: 'financialContracts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:53:07'!
add: aFinancialContract
	financialContracts addFirst: aFinancialContract.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:53:29'!
balance
	financialContracts isEmpty ifTrue: [ ^ 0 * peso ].
	^ financialContracts
		inject: 0 * peso
		into: [ :currentBalance :aFinancialContract |
			aFinancialContract effectOnPortfolio: currentBalance ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:52:20'!
initialize
	financialContracts _ OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:02:26'!
register: aTransaction
	^ self error: self class PortfolioCannotRegisterATransactionErrorDescription.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:52:20'!
seeTransactionsOf: aFinancialContract
	| index |
	index _ financialContracts find: aFinancialContract.
	^ (financialContracts at: index) transactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:52:20'!
transactions
	| transactions |
	transactions _ OrderedCollection new.
	1
		to: financialContracts size
		do: [ :index |
			transactions addAllLast: (financialContracts at: index) transactions ].
	^ transactions.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:02:48'!
PortfolioCannotRegisterATransactionErrorDescription
	^ 'error'.! !


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



!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:18:04'!
counterpart
	^ counterpart.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 19:41:21'!
effectOnBalance: aBalance
	^ self value + aBalance.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 7/5/2021 11:02:02'!
initializeFor: aValue
	value _ aValue.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:28:04'!
initializeFor: aValue withCounterpart: aTransaction
	value := aValue. 
	counterpart := aTransaction.! !

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

!Transfer class methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:30:01'!
for: aValue
	| withdraw deposit |
	withdraw _ self new.
	deposit _ self new.
	withdraw
		initializeFor: aValue negated
		withCounterpart: deposit.
	deposit
		initializeFor: aValue
		withCounterpart: withdraw.
	^ OrderedCollection
		with: deposit
		with: withdraw.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'mg 7/7/2021 15:31:37'!
register: aValue on: receiverAccount from: senderAccount
	| transactionWithdraw transactions |
	senderAccount balance < aValue ifTrue: [ self error: Transfer TransferenciaErrorDescription ].
	"transactionWithdrawal _ self for: aValue negated.
	transactionDeposit _ self for: aValue."
	transactions _ self for: aValue.
	senderAccount register: transactions last.
	receiverAccount register: transactions first.
	^ transactions.! !
