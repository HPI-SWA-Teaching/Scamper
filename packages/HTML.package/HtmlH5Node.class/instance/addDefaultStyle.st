initialize-release
addDefaultStyle
	| styles |
	styles := Dictionary newFrom: {
		'display' -> 'block'.
		'font-size' -> '0.83em'.
		'font-weight' -> 'bold'.
		'margin' -> '1.67em 0'
	}.
	self addStyle: (CSSDefaultStyleRule fromDictionary: styles)