"
I am an extended version of the attributes builder with an ability to delegate the applying of attributes to the other stylable, which can be a ${class:BlText}$ or the other ${class:BlTextAttributesBuilder}$
"
Class {
	#name : #BlTextDelegatedAttributesBuilder,
	#superclass : #BlTextAttributesBuilder,
	#instVars : [
		'attributesTarget'
	],
	#category : 'Bloc-Text-Text-Support'
}

{ #category : #accessing }
BlTextDelegatedAttributesBuilder >> attribute: aTextAttribute [
	super attribute: aTextAttribute.
	self attributesTarget attribute: aTextAttribute
]

{ #category : #accessing }
BlTextDelegatedAttributesBuilder >> attributesTarget [
	<return: #TBlTextStyleable>

	^ attributesTarget
]

{ #category : #accessing }
BlTextDelegatedAttributesBuilder >> attributesTarget: aTBlTextStyleable [
	attributesTarget := aTBlTextStyleable.
	self applyOn: attributesTarget
]
