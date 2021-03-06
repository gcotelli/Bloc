Class {
	#name : #BlBaseFocusEvent,
	#superclass : #BlEvent,
	#category : 'Bloc-Event'
}

{ #category : #converting }
BlBaseFocusEvent >> asBlurEvent [
	^ BlBlurEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
BlBaseFocusEvent >> asFocusEvent [
	^ BlFocusEvent new
		copyFrom: self;
		yourself
]

{ #category : #converting }
BlBaseFocusEvent >> asFocusInEvent [
	^ BlFocusInEvent new
		copyFrom: self;
		canBePropagated: false;
		yourself
]

{ #category : #converting }
BlBaseFocusEvent >> asFocusOutEvent [
	^ BlFocusOutEvent new
		copyFrom: self;
		canBePropagated: false;
		yourself
]

{ #category : #testing }
BlBaseFocusEvent >> isBaseFocus [
	^ true
]
