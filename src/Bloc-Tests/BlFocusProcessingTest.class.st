Class {
	#name : #BlFocusProcessingTest,
	#superclass : #BlEventTestCase,
	#category : 'Bloc-Tests-Universe'
}

{ #category : #accessing }
BlFocusProcessingTest >> firedEvents [
	^ space focusProcessor firedEvents
]

{ #category : #tests }
BlFocusProcessingTest >> testFocus [
	self assert: self child focused not.
	self assert: self root focused.
	
	self assertFiredEventIs: BlFocusInEvent target: self root withPropagation: false.
	self assertFiredEventIs: BlFocusEvent target: self root withPropagation: true.
	
	self child requestFocus.
	
	self assertFiredEventIs: BlFocusOutEvent target: self root withPropagation: false.
	self assertFiredEventIs: BlBlurEvent target: self root withPropagation: true.
	self assertFiredEventIs: BlFocusInEvent target: self child withPropagation: false.
	self assertFiredEventIs: BlFocusEvent target: self child withPropagation: true.
	self assert:self child focused.
	self assert: self root focused not.
	
	self root requestFocus.
	
	self assertFiredEventIs: BlFocusOutEvent target: self child withPropagation: false.
	self assertFiredEventIs: BlBlurEvent target: self child withPropagation: true.
	
	self assertFiredEventIs: BlFocusInEvent target: self root withPropagation: false.
	self assertFiredEventIs: BlFocusEvent target: self root withPropagation: true.
	
	self assert:self child focused not.
	self assert: self root focused.
]
