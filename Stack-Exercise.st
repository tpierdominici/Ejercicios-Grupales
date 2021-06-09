!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stackWithDifferentsSentences sentenceFinder sentenceOne sentenceTwo sentenceThree sentenceFour sentenceFive stackWithEqualsSentences emptyPrefix blankPrefix prefixWithNoResults'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'TP 6/9/2021 19:29:43'!
assertThat: anAction isAnErrorOfType: errorType 
	
	self 
		should: anAction
		raise: Error
		withExceptionDo:[:anError | self assert: anError messageText equals: errorType].! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'TP 6/9/2021 19:42:06'!
assertThatStackOrderDidntChange: anStack
	
	self assert: (sentenceFive =(anStack pop)).
	self assert: (sentenceFour =(anStack pop)).
	self assert: (sentenceThree =(anStack pop)).
	self assert: (sentenceTwo = (anStack pop)).
	self assert: (sentenceOne = (anStack pop)).
	

	! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 19:29:43'!
test01PrefixCanNotBeVoid
		
	
		self assertThat:[sentenceFinder find: emptyPrefix] isAnErrorOfType: SentenceFinderByPrefix prefixCanNotBeVoidErrorDescription.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 19:29:43'!
test02PrefixCanNotHaveBlanks
	
	
		self assertThat:[sentenceFinder find: blankPrefix] isAnErrorOfType: SentenceFinderByPrefix prefixCanNotHaveBlankSpacesErrorDescription.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 19:42:18'!
test03APrefixThatWasntFoundInStackShouldNotChangeStackOrder
	 
	sentenceFinder find: prefixWithNoResults .
	self assertThatStackOrderDidntChange: stackWithDifferentsSentences .
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 19:44:49'!
test04APrefixThatWasFoundInStackShouldNotChangeStackOrder
	|prefijo |
	prefijo := 'Isla'.
	sentenceFinder find: prefijo.
	self assertThatStackOrderDidntChange: stackWithDifferentsSentences .
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 19:44:24'!
test05APrefixThatWasntFoundResultInAnEmptyCollection
	|elementsFinded|
	elementsFinded :=sentenceFinder find: prefixWithNoResults .
	self assert: (elementsFinded isEmpty).
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 19:57:26'!
test06FindeOnlySentenceWithUpperCasePrefix
	|prefix elementsFinded expectedCollectionOfElements|
	prefix :='Ver'.
	expectedCollectionOfElements:= OrderedCollection with: sentenceFour with:sentenceOne.
	elementsFinded :=sentenceFinder find: prefix.
	self assert: expectedCollectionOfElements = elementsFinded .
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 19:54:57'!
test07FindeOnlySentenceWithLowerCasePrefix
	|prefix elementsFinded expectedCollectionOfElements |
	prefix :='ver'.
	expectedCollectionOfElements:= OrderedCollection with: sentenceThree.
	elementsFinded :=sentenceFinder find: prefix.
	self assert: expectedCollectionOfElements = elementsFinded .
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 19:55:19'!
test08APrefixWithSomeEqualsLettersThatWasntFoundResultInAnEmptyCollection
	|prefix elementsFinded|
	prefix :='Veral'.
	elementsFinded :=sentenceFinder find: prefix.
	self assert: (elementsFinded isEmpty ).
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 20:00:12'!
test09APrefixThatWasFoundInAllSentencesOfStackResultInACollectionEqualToStack
	|prefix elementsFinded expectedCollectionOfElements |
	sentenceFinder _ SentenceFinderByPrefix new initializeWith: stackWithEqualsSentences.
	prefix := 'Ver'.
	expectedCollectionOfElements:= OrderedCollection with: sentenceOne with: sentenceOne with: sentenceOne.
	elementsFinded:=sentenceFinder find: prefix.
	
	self assert: expectedCollectionOfElements = elementsFinded .
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 20:18:21'!
test10CantInitializeSentenceFinderWithNonStack

	| notStack |
	notStack:= 'mountain'.
	self assertThat:[SentenceFinderByPrefix new initializeWith: notStack] isAnErrorOfType: SentenceFinderByPrefix stackMustBeOOStackClass .! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TP 6/9/2021 20:17:28'!
test11PrefixShouldBeStringClass

	| prefix |
	prefix:= 4.
	self assertThat:[sentenceFinder find: prefix] isAnErrorOfType: SentenceFinderByPrefix prefixMustBeStringClass .! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'TP 6/9/2021 20:01:12'!
setUp
	stackWithDifferentsSentences _ OOStack new.
	stackWithEqualsSentences _ OOStack new.
	sentenceOne := 'Verano en la playa'.
	sentenceTwo := 'Invierno en el sur'.
	sentenceThree := 'verano en el mar'.
	sentenceFour := 'Ver los pajaros'.
	sentenceFive := 'Isla'.
	stackWithDifferentsSentences push: sentenceOne.
	stackWithDifferentsSentences push: sentenceTwo.
	stackWithDifferentsSentences push: sentenceThree.
	stackWithDifferentsSentences push: sentenceFour .
	stackWithDifferentsSentences push: sentenceFive .
	stackWithEqualsSentences push: sentenceOne.
	stackWithEqualsSentences push: sentenceOne.
	stackWithEqualsSentences push: sentenceOne.
	sentenceFinder _ SentenceFinderByPrefix new initializeWith: stackWithDifferentsSentences.
	emptyPrefix := ''.
	blankPrefix := ' '.
	prefixWithNoResults := 'tel'.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefixTest class' category: 'Stack-Exercise'!
SentenceFinderByPrefixTest class
	instanceVariableNames: 'stack'!


!classDefinition: #ElementsInStack category: 'Stack-Exercise'!
Object subclass: #ElementsInStack
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ElementsInStack methodsFor: 'initialization' stamp: 'TP 6/8/2021 19:23:07'!
initializeWith: something
	 content _ something.! !


!ElementsInStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:38:29'!
getContent
	^ content.! !

!ElementsInStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:25:47'!
isEmpty

	^false.! !

!ElementsInStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:48:24'!
removeFrom: collection
	collection remove: self.
	^content.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElementsInStack class' category: 'Stack-Exercise'!
ElementsInStack class
	instanceVariableNames: ''!

!ElementsInStack class methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:22:25'!
with: something
	^ self new initializeWith: something.! !


!classDefinition: #Base category: 'Stack-Exercise'!
ElementsInStack subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:31:39'!
getContent
	^ self error: OOStack stackEmptyErrorDescription.! !

!Base methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:07:34'!
haveINoElementsOnTopMe: stack
	^ stack elements size >= 2.! !

!Base methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:27:00'!
isEmpty

	^true.! !

!Base methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:46:22'!
removeFrom: collection
	^ self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 18:56:17'!
initialize
	elements _ OrderedCollection new.
	elements add: Base new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:25:30'!
isEmpty
	^ elements last isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:45:00'!
pop
	^ elements last removeFrom: elements.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:52:07'!
push: something
	^ elements addLast: (ElementsInStack with: something).! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:33:15'!
size
	^ elements size-1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'TP 6/8/2021 19:30:11'!
top
	^ elements last getContent.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #OOStackLimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimited
	instanceVariableNames: 'maxCapacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimited methodsFor: 'as yet unclassified' stamp: 'TP 6/9/2021 20:46:45'!
initializeWithNumberOfElements: aPositveNumber
	
	elements := OrderedCollection new .
	maxCapacity := aPositveNumber.
	elements add: Base new.! !

!OOStackLimited methodsFor: 'as yet unclassified' stamp: 'TP 6/9/2021 20:47:12'!
push: something
	(self size = maxCapacity ) ifTrue:[^self error: self class canNotAddMoreElementsErrorDescription].
	^ elements addLast: (ElementsInStack with: something).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackLimited class' category: 'Stack-Exercise'!
OOStackLimited class
	instanceVariableNames: ''!

!OOStackLimited class methodsFor: 'as yet unclassified' stamp: 'TP 6/9/2021 20:47:45'!
canNotAddMoreElementsErrorDescription

	^'No se pueden agregar mas elementos pues el stack esta lleno'.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'TP 6/9/2021 20:08:34'!
initializeWith: aStack
	(aStack class=OOStack) ifFalse: [^ self error: self class stackMustBeOOStackClass]. 
	 stack:= aStack.! !


!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'TP 6/9/2021 20:09:35'!
find: prefix
	|collectionOfStackElements stackSize |
	(prefix isString ) ifFalse:[^self error: SentenceFinderByPrefix prefixMustBeStringClass].
	(prefix isEmpty) ifTrue:[^self error: SentenceFinderByPrefix prefixCanNotBeVoidErrorDescription ].
	((prefix findString: ' ') >0) ifTrue:[^self error: SentenceFinderByPrefix prefixCanNotHaveBlankSpacesErrorDescription ]. 
	stackSize := stack size.
	collectionOfStackElements _ OrderedCollection new.
	stackSize timesRepeat: [collectionOfStackElements add: (stack pop)].
	stackSize to: 1 by: -1 do: [:position| stack push: (collectionOfStackElements at: position)]. 
	^collectionOfStackElements select:[:sentence| sentence beginsWith: prefix].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TP 6/9/2021 15:27:24'!
prefixCanNotBeVoidErrorDescription

	^'El prefijo no puede ser vacio'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TP 6/9/2021 15:30:04'!
prefixCanNotHaveBlankSpacesErrorDescription

	^ 'El prefijo no puede contener espacios'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TP 6/9/2021 20:10:23'!
prefixMustBeStringClass

	^'El prefijo tiene que ser clase String'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TP 6/9/2021 20:08:45'!
stackMustBeOOStackClass
	
	^'SentenceFinderByPrefix tiene que recibir un stack como colaborador.'! !
