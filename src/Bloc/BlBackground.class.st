"
I represent the background of a BlElement.
Use me as an immutable object.

Background can be instantiated and composed directly or with the help of ===BlBackgroundBuilder===.
See ===BlBackgroundBuilder=== for the related example
"
Class {
	#name : #BlBackground,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'opacity'
	],
	#category : 'Bloc-Basic-Visual'
}

{ #category : #builder }
BlBackground class >> builder [
	^ BlBackgroundBuilder new
]

{ #category : #'instance creation' }
BlBackground class >> image: aForm [
	<return: #BlBackground>
	
	^ BlImageBackground image: aForm
]

{ #category : #'instance creation' }
BlBackground class >> paint: aColorOrBlPaint [
	<return: #BlBackground>

	^ BlPaintBackground paint: aColorOrBlPaint
]

{ #category : #'instance creation' }
BlBackground class >> transparent [
	"Return a completely transparent background"
	<return: #BlBackground>
	
	^ BlTransparentBackground uniqueInstance
]

{ #category : #converting }
BlBackground >> asBlBackground [
	^ self
]

{ #category : #initialization }
BlBackground >> defaultOpacity [
	"By default background is completely opaque"
	<return: #Number>

	^ 1.0
]

{ #category : #testing }
BlBackground >> isTransparent [
	"Return true if background is transparent and should not be rendered, false otherwise"
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : #geometry }
BlBackground >> matchExtent: anExtent [
	"Resize background to match given extent.
	Used to adapt image or gradient backgrounds to the element's extent"

	self subclassResponsibility
]

{ #category : #accessing }
BlBackground >> opacity [
	<return: #Number>

	^ opacity ifNil: [ self defaultOpacity ]
]

{ #category : #accessing }
BlBackground >> opacity: aNumber [
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Opacity must not be nil' ].
	self
		assert: [ aNumber between: 0.0 and: 1.0 ]
		description: [ 'Opacity value must be within interval [0..1]' ].
	self
		assert: [ opacity isNil ]
		description: [ 'Opacity can not be changed once set. Background is immutable!' ].
	
	opacity := aNumber
]
