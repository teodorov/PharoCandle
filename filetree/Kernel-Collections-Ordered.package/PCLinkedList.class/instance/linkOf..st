as yet unclassified
linkOf: anObject
	^ self linkOf: anObject ifAbsent: [ self error: 'No such element' ]