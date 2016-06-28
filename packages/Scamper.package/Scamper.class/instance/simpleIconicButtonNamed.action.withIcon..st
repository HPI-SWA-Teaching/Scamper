window definition
simpleIconicButtonNamed: buttonLabel action: selector withIcon: iconForm
	"Create and return a simple button with Scamper as the target."

	^IconicButton new
		"label: buttonLabel;"
		target: self;
		labelGraphic: iconForm;
		color: Color transparent;
		borderWidth: 0;
		extent: 25@25;
		actionSelector: selector;
		actWhen: #buttonUp;
		yourself