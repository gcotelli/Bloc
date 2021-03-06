Class {
	#name : #BlSequentialAnimation,
	#superclass : #BlCompositeAnimation,
	#instVars : [
		'currentIndex'
	],
	#category : 'Bloc-Animation-Basic'
}

{ #category : #pulse }
BlSequentialAnimation >> doStep [
	| shouldStartNext aCurrentAnimation |

	(currentIndex > animations size)
		ifTrue: [ ^ self ].

	(currentIndex isZero and: [ animations isEmpty ])
		ifTrue: [ ^ self ].

	shouldStartNext := currentIndex isZero or: [ (animations at: currentIndex) isRunning not ].
	
	shouldStartNext ifTrue: [ 
		currentIndex := currentIndex + 1.
		
		"make sure we are not going out of bounds"
		(currentIndex > animations size)
			ifTrue: [ ^ self ] ].

	aCurrentAnimation := animations at: currentIndex.
	aCurrentAnimation run.
	
	(aCurrentAnimation isRunning not)
		ifTrue: [ self doStep ]
]

{ #category : #'api - accessing' }
BlSequentialAnimation >> duration [
	"Return animation duration. Duration can not necessarily be set manually, in case
	of composite animations it is computed on-fly based on durations of their sub-animations"
	<return: #Duration>

	^ self animations
		ifEmpty: [ 0 seconds ]
		ifNotEmpty: [ :theAnimations | theAnimations sum: [ :anAnimation | (anAnimation duration + anAnimation delay) * anAnimation loops ] ]
]

{ #category : #pulse }
BlSequentialAnimation >> initStart [
	super initStart.

	currentIndex := 0.
	self animations do: [ :anAnimation |	anAnimation reset ]
]

{ #category : #initialization }
BlSequentialAnimation >> initialize [
	super initialize.
	currentIndex := 0
]
