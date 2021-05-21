!classDefinition: #NumeroTest category: 'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:40'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:25'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:15:37'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'mg 5/20/2021 19:59:12'!
test08FraccionMultipliesWithFraccionCorrectly
	"La multiplicacion de fracciones es:
	(a/b) * (c/d) = (a.c) / (b.d)"
	self
		assert: oneFifth * twoFifth
		equals: twoTwentyfifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:16:19'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:26:23'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:44:24'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: (Numero with: negativeOne over: two)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'mg 5/20/2021 19:59:47'!
setUp
	zero := Numero with: 0.
	one _ Numero with: 1.
	two _ Numero with: 2.
	three _ Numero with: 3.
	four _ Numero with: 4.
	five _ Numero with: 5.
	eight _ Numero with: 8.
	negativeOne _ Numero with: -1.
	negativeTwo _ Numero with: -2.
	oneHalf _ Numero
		with: one
		over: two.
	oneFifth _ Numero
		with: one
		over: five.
	twoFifth _ Numero
		with: two
		over: five.
	twoTwentyfifth _ Numero
		with: two
		over: (Numero with: 25).
	fiveHalfs _ Numero
		with: five
		over: two.! !


!classDefinition: #Numero category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: 'value denominator numerator type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 5/20/2021 20:54:12'!
* aMultiplier 

	type = #Entero ifTrue:	
		[ ^self class with: value * aMultiplier integerValue ].
		
	type = #Fraccion ifTrue:
		[ ^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator) ].
		
	self error: 'Tipo de número no soportado'
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 5/20/2021 20:54:13'!
+ anAdder 
	
	type = #Entero ifTrue:
		[ ^self class with: value + anAdder integerValue ].
	
	type = #Fraccion ifTrue:
		[ | newNumerator newDenominator |
		
		newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		newDenominator := denominator * anAdder denominator.
		
		^ self class with: newNumerator over: newDenominator ].
	
	self error: 'Tipo de número no soportado'
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 5/20/2021 20:54:13'!
negated
	
	type = #Entero ifTrue:
		[ ^self * (self class with: -1) ].
		
	type = #Fraccion ifTrue:
		[ ^self class with: numerator * (self class with: -1) over: denominator ].! !


!Numero methodsFor: 'testing' stamp: 'mg 5/20/2021 21:11:33'!
assertIsNegative
	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'mg 5/20/2021 22:06:43'!
isNegative
	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'mg 5/20/2021 22:06:51'!
isOne
	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'mg 5/20/2021 22:07:00'!
isZero
	self subclassResponsibility.! !


!Numero methodsFor: 'initialization' stamp: 'mg 5/20/2021 20:53:41'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Numero methodsFor: 'initialization' stamp: 'mg 5/20/2021 20:54:13'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:=#Fraccion.
	numerator := aNumerator.
	denominator := aDenominator ! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'printing' stamp: 'mg 5/20/2021 20:54:13'!
printOn: aStream
	
	type = #Entero ifTrue:
		[ aStream print: value ].
	
	type = #Fraccion ifTrue:
		[ aStream 
			print: numerator;
			nextPut: $/;
			print: denominator ].! !


!Numero methodsFor: 'comparing' stamp: 'mg 5/20/2021 20:54:13'!
= anObject

	((anObject isKindOf: self class) and: [ type = anObject type ]) ifTrue: [
		type = #Entero ifTrue: [ ^value = anObject integerValue ].
		type = #Fraccion ifTrue: [ ^(numerator * anObject denominator) = (denominator * anObject numerator) ].
		^false
	].

	^false
! !

!Numero methodsFor: 'comparing' stamp: 'mg 5/20/2021 20:54:13'!
hash
	type = #Entero ifTrue:
		[ ^value hash ].
	type = #Fraccion ifTrue:
		[ ^(numerator hash / denominator hash) hash ].! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'mg 5/20/2021 20:53:41'!
// aDivisor 
	
	type = #Entero ifTrue:
		[ ^self class with: value // aDivisor integerValue ].
		
	self error: 'Tipo de número no soportado'! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'mg 5/20/2021 20:53:41'!
greatestCommonDivisorWith: anEntero 
	
	type = #Entero ifTrue:
		[ ^self class with: (value gcd: anEntero integerValue) ].
		
	self error: 'Tipo de número no soportado'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: 'number'!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'mg 5/20/2021 21:57:53'!
with: aValue
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	^ Entero new initializeWith: aValue.! !

!Numero class methodsFor: 'instance creation' stamp: 'mg 5/20/2021 21:58:02'!
with: aDividend over: aDivisor
	| greatestCommonDivisor numerator denominator |
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^ aDividend ].
	aDivisor isNegative ifTrue: [ ^ self
			with: aDividend negated
			over: aDivisor negated ].
	greatestCommonDivisor _ aDividend greatestCommonDivisorWith: aDivisor.
	numerator _ aDividend // greatestCommonDivisor.
	denominator _ aDivisor // greatestCommonDivisor.
	denominator isOne ifTrue: [ ^ numerator ].
	^ Fraccion new
		initializeWith: numerator
		over: denominator.! !


!classDefinition: #Entero category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 5/20/2021 22:01:46'!
isNegative
	^ value < 0.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 5/20/2021 21:32:25'!
isOne
	^ value = 1.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 5/20/2021 21:33:27'!
isZero
	^ value = 0! !


!classDefinition: #Fraccion category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'mg 5/20/2021 21:17:06'!
isNegative
	^ denominator < 0.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'mg 5/20/2021 21:32:50'!
isOne
	^ false.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'mg 5/20/2021 22:06:33'!
isZero
	^ false.! !


!classDefinition: #ZZZ category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #ZZZ
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!
