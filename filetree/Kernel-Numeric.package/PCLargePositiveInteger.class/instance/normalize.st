as yet unclassified
normalize
	"Check for leading zeroes and return shortened copy if so"

	| sLen val len oldLen |
	"First establish len = significant length"
	len := oldLen := self digitLength.
	[ len = 0
		ifTrue: [ ^ 0 ].
	(self digitAt: len) = 0 ] whileTrue: [ len := len - 1 ].	"Now check if in SmallInteger range"
	sLen := PCSmallInteger maxVal digitLength.
	(len <= sLen
		and: [ (self digitAt: sLen) <= (PCSmallInteger maxVal digitAt: sLen) ])
		ifTrue: [ val := 0.
			len to: 1 by: -1 do: [ :i | val := val * 256 + (self digitAt: i) ].
			^ val ].
	"If so, return its SmallInt value"	"Return self, or a shortened copy"
	len < oldLen
		ifTrue: [ ^ self growto: len ]
		ifFalse: [ ^ self ]