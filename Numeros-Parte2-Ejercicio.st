!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'TP 5/30/2021 19:15:21'!
setUp
	zero _ Cero with: 0.
	one _ NoCero with: 1.
	two _ NoCero with: 2.
	three _ NoCero with: 3.
	four _ NoCero with: 4.
	five _ NoCero with: 5.
	eight _ NoCero with: 8.
	negativeOne _ NoCero with: -1.
	negativeTwo _ NoCero with: -2.
	oneHalf _ one / two.
	oneFifth _ one / five.
	twoFifth _ two / five.
	twoTwentyfifth _ two / (NoCero with: 25).
	fiveHalfs _ five / two.! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'mg 5/27/2021 21:09:16'!
beAddedToEntero: anEnteroAugend
	self subclassResponsibility! !

!Numero methodsFor: 'private' stamp: 'TP 5/29/2021 18:36:52'!
beAddedToFraccion: aFraccionAugend
	^ self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'TP 5/29/2021 19:06:52'!
beMultipliedByEntero: anEnteroMultiplier
	^ self subclassResponsibility .! !

!Numero methodsFor: 'private' stamp: 'TP 5/29/2021 19:09:06'!
beMultipliedByFraccion: aFraccionMultiplier

	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'TP 5/29/2021 19:45:56'!
beSubtractedByEntero: AnEnteroMinuend

	^ self subclassResponsibility .! !

!Numero methodsFor: 'private' stamp: 'TP 5/29/2021 19:55:54'!
beSubtractedByFraccion: aFraccionMinuend

	^self subclassResponsibility ! !

!Numero methodsFor: 'private' stamp: 'TP 5/29/2021 19:27:21'!
divideEntero: anEnteroDividend
	^ self subclassResponsibility .! !

!Numero methodsFor: 'private' stamp: 'TP 5/29/2021 19:28:46'!
divideFraccion: aFraccionDividend

	^ self subclassResponsibility.

	! !

!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'TP 5/29/2021 19:06:52'!
* aMultiplier
	
	^ aMultiplier beMultipliedByEntero: self.
	
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'mg 5/27/2021 21:06:13'!
+ anAdder
	^ anAdder beAddedToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TP 5/29/2021 19:53:54'!
- aSubtrahend
	^ aSubtrahend beSubtractedByEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TP 5/29/2021 19:27:21'!
/ aDivisor
	^ aDivisor divideEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'TP 5/30/2021 19:20:13'!
isZero
	^ value = 0.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 20:55:42'!
XXX


	^ self subclassResponsibility .! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:22:26'!
beAddedToEntero: anEnteroAugend
	^ self class with: anEnteroAugend integerValue + value.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:34:44'!
beAddedToFraccion: aFraccionAugend
	^ self * aFraccionAugend denominator + aFraccionAugend numerator / aFraccionAugend denominator.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:36:07'!
beMultipliedByEntero: anEnteroMultiplier
	^ self class with: value * anEnteroMultiplier integerValue.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:37:29'!
beMultipliedByFraccion: aFraccionMultiplier
	^ aFraccionMultiplier numerator * self / aFraccionMultiplier denominator.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:30:01'!
beSubtractedByEntero: anEnteroMinuend
	anEnteroMinuend integerValue - value = 0 ifTrue: [ ^ Cero with: 0 ].
	^ self class with: anEnteroMinuend integerValue - value.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:55:54'!
beSubtractedByFraccion: aFraccionMinuend
	^ aFraccionMinuend numerator - (self * aFraccionMinuend denominator) / aFraccionMinuend denominator .! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 20:42:01'!
canThisNumberBeADivisor

		^self subclassResponsibility.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:39:09'!
canThisNumberBeANumerator
	^ self subclassResponsibility.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:27:21'!
divideEntero: anEnteroDividend
	^ Fraccion
			with: anEnteroDividend
			over: self.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:30:07'!
divideFraccion: aFraccionDividend
	^ aFraccionDividend numerator / (aFraccionDividend denominator * self).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'TP 5/30/2021 20:38:38'!
with: aValue
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	aValue isZero ifTrue: [ ^ Cero new initalizeWith: 0 ].
	aValue = 1 ifTrue: [ ^ Uno new initalizeWith: 1 ].
	^ NoCero new initalizeWith: aValue.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 20:55:14'!
XXX
	^ self value.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 20:47:24'!
canThisNumberBeADivisor
	^ self error: self class canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:38:42'!
canThisNumberBeANumerator
	^ self error: 'una fraccion no puede ser cero'.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:04:39'!
isZero

	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:53:28'!
initializeInItsClass
	^ self class new initializeWith: 0.! !


!classDefinition: #NoCero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #NoCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NoCero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 20:55:05'!
XXX

! !

!NoCero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 20:23:31'!
canThisNumberBeADenominator
	^ self.! !

!NoCero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 20:44:11'!
canThisNumberBeADivisor

! !

!NoCero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:38:29'!
canThisNumberBeANumerator
	^ self.! !

!NoCero methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:04:59'!
isZero
	^ false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoCero class' category: 'Numeros-Parte2-Ejercicio'!
NoCero class
	instanceVariableNames: ''!

!NoCero class methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 19:55:04'!
initializeInItsClass
	^ self class new initializeWith: self .! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
NoCero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 20:23:23'!
canThisNumberBeADenominator
	^ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' .! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TP 5/29/2021 19:12:30'!
* aMultiplier
	^ aMultiplier beMultipliedByFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TP 5/29/2021 18:46:15'!
+ anAdder
	^ anAdder beAddedToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TP 5/29/2021 19:55:54'!
- aSubtrahend
	^ aSubtrahend beSubtractedByFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TP 5/29/2021 19:32:32'!
/ aDivisor
	^ aDivisor divideFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'TP 5/30/2021 20:23:41'!
initializeWith: aNumerator over: aDenominator
	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator canThisNumberBeANumerator.
	aDenominator canThisNumberBeADenominator.
	numerator _ aNumerator.
	denominator _ aDenominator.! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 18:41:03'!
beAddedToEntero: anEnteroAugend
	^ self + anEnteroAugend .! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 18:42:06'!
beAddedToFraccion: aFraccionAugend
	|newNumerator newDenominator|
	newNumerator _ numerator * aFraccionAugend denominator + (denominator * aFraccionAugend numerator).
			newDenominator _ denominator * aFraccionAugend denominator.
			^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 18:42:14'!
beMultipliedByEntero: anEnteroMultiplier
	^ self * anEnteroMultiplier .! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:11:44'!
beMultipliedByFraccion: aFraccionMultiplier
	^ numerator * aFraccionMultiplier numerator / (denominator * aFraccionMultiplier denominator) .! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:45:56'!
beSubtractedByEntero: anEnteroMinuend
	^ anEnteroMinuend *  denominator -  numerator /  denominator! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'TP 5/30/2021 18:28:30'!
beSubtractedByFraccion: aFraccionMinuend
	| newNumerator newDenominator |
	newNumerator _ aFraccionMinuend numerator *  denominator - (aFraccionMinuend denominator *  numerator).
	newDenominator _ aFraccionMinuend denominator *  denominator.
	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:27:21'!
divideEntero: anEnteroDividend

	^ anEnteroDividend *  denominator /  numerator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'TP 5/29/2021 19:31:56'!
divideFraccion: aFraccionDividend
	^ aFraccionDividend numerator *  denominator / ( aFraccionDividend denominator * numerator).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'TP 5/30/2021 20:55:51'!
with: aDividend over: aDivisor
	| greatestCommonDivisor numerator denominator |
	aDivisor canThisNumberBeADivisor.
	aDividend XXX.
	aDivisor isNegative ifTrue: [ ^ aDividend negated / aDivisor negated ].
	greatestCommonDivisor _ aDividend greatestCommonDivisorWith: aDivisor.
	numerator _ aDividend // greatestCommonDivisor.
	denominator _ aDivisor // greatestCommonDivisor.
	denominator isOne ifTrue: [ ^ numerator ].
	^ self new
		initializeWith: numerator
		over: denominator.! !
