Extension { #name : #Form }

{ #category : #'*Bloc' }
Form >> asBlBackground [
	^ BlBackground image: self
]

{ #category : #'*Bloc' }
Form >> asElement [
	^ BlElement new
		size: self extent;
		background: (BlBackground image: self);
		yourself
]

{ #category : #'*Bloc' }
Form >> asForm [
	^ self
]

{ #category : #'*Bloc' }
Form >> isSystemCursor [
	^ false
]
