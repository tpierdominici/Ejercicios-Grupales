!classDefinition: #Caja category: 'FactorioParte2'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'FactorioParte2'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:07:37'!
agregar: unaMena
	contenido add: unaMena.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:42:38'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:08:26'!
cantidadDeMenas
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'TP 5/3/2021 21:42:36'!
cantidadDeMenasDeCarbon
	
	^contenido count: [ :cadaElemento | cadaElemento = 'una mena de carbon' ].
	! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:30:46'!
cantidadDeMenasDeHierro
	
	^contenido count: [ :cadaElemento | cadaElemento = 'una mena de hierro' ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'TP 5/10/2021 13:21:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:09:06'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #Cinta category: 'FactorioParte2'!
DenotativeObject subclass: #Cinta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cinta class' category: 'FactorioParte2'!
Cinta class
	instanceVariableNames: 'contenido destino'!

!Cinta class methodsFor: 'as yet unclassified' stamp: 'TP 5/3/2021 21:21:30'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:11:04'!
cantidadDeMenas
	
	^contenido size.! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'TP 5/3/2021 21:14:00'!
destino: unaCaja 
	destino:= unaCaja.! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'TP 5/10/2021 13:21:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).
	destino := Caja.! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'TP 5/3/2021 21:31:00'!
transportarMenas
	|cantidadDeMenas|
	cantidadDeMenas :=  contenido.
	self vaciar.
	^destino agregarMenas: cantidadDeMenas.
	! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'TP 5/3/2021 21:12:30'!
vaciar
	contenido:= OrderedCollection new.! !


!classDefinition: #CintaA category: 'FactorioParte2'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'FactorioParte2'!
CintaA class
	instanceVariableNames: 'contenido destino'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:02'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:02'!
cantidadDeMenas
	
	^contenido size.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:02'!
destino: unaCaja 
	destino:= unaCaja.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'TP 5/10/2021 13:21:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).
	destino := Caja.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:02'!
transportarMenas
	|cantidadDeMenas|
	cantidadDeMenas :=  contenido.
	self vaciar.
	^destino agregarMenas: cantidadDeMenas.
	! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:02'!
vaciar
	contenido:= OrderedCollection new.! !


!classDefinition: #CintaB category: 'FactorioParte2'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'FactorioParte2'!
CintaB class
	instanceVariableNames: 'contenido destino'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:10'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:10'!
cantidadDeMenas
	
	^contenido size.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:10'!
destino: unaCaja 
	destino:= unaCaja.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'TP 5/10/2021 13:21:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).
	destino := CintaA.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:10'!
transportarMenas
	|cantidadDeMenas|
	cantidadDeMenas :=  contenido.
	self vaciar.
	^destino agregarMenas: cantidadDeMenas.
	! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:21:10'!
vaciar
	contenido:= OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'FactorioParte2'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'TP 4/16/2021 15:23:11'!
actualizarEnergia: energiaConsumida
	
	energiaActual := energiaActual -energiaConsumida .
	^energiaConsumida .! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:23:04'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'TP 5/3/2021 21:44:58'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:29:41'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:21:02'!
energiaActual

	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'TP 4/17/2021 14:41:29'!
energiaParaExtraerTodasLasMenas: menasAProducir
	
	^(menasAProducir * costoDeEnergiaPorMena)! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:34:57'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'TP 5/10/2021 13:21:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := Cinta.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:27'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:36:12'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:57'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #ExtractorDeHierro category: 'FactorioParte2'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'FactorioParte2'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
actualizarEnergia: energiaConsumida
	
	energiaActual := energiaActual -energiaConsumida .
	^energiaConsumida .! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:59'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
energiaActual

	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
energiaParaExtraerTodasLasMenas: menasAProducir
	
	^(menasAProducir * costoDeEnergiaPorMena)! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/10/2021 13:21:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaB.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:19:43'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #PruebasDeExtractorDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'FactorioParte2'!
PruebasDeExtractorDeCarbon class
	instanceVariableNames: ''!

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:37:39'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:41:43'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:46:54'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:47:56'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:49:57'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 7 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:50:53'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 50 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 10.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeFactorio category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'FactorioParte2'!
PruebasDeFactorio class
	instanceVariableNames: ''!

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:29:49'!
testEscenarioDosExtractoresDosCintasCaja

	ExtractorDeCarbon ponerEnCeroLaEnergia .
	ExtractorDeHierro ponerEnCeroLaEnergia .
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	ExtractorDeHierro destino: CintaB.
	CintaA destino: Caja.
	CintaB destino: CintaA.
	CintaA vaciar.
	CintaB vaciar.
	Caja vaciar.
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer .
	CintaB transportarMenas .
	CintaA transportarMenas .
	
	
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.
	Assert that: CintaB cantidadDeMenas isEqualTo: 0.
	Assert that: Caja cantidadDeMenas isEqualTo: 2.
	Assert that: Caja 	cantidadDeMenasDeCarbon isEqualTo: 1.
	Assert that: Caja 	cantidadDeMenasDeHierro isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:43:17'!
testEscenarioExtractorCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.
	ExtractorDeCarbon extraer.
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'TP 5/5/2021 14:09:32'!
testEscenarioExtractorCintaCaja

	ExtractorDeCarbon ponerEnCeroLaEnergia .
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Cinta.
	Cinta vaciar.
	Cinta destino: Caja.
	Caja vaciar.
	ExtractorDeCarbon extraer .
	Cinta transportarMenas.
	
	Assert that: Cinta cantidadDeMenas isEqualTo: 0.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	
	! !

Caja initializeAfterFileIn!
Cinta initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!