accessing
empty

	^Empty isNil ifTrue: [Empty := self new] ifFalse: [Empty]