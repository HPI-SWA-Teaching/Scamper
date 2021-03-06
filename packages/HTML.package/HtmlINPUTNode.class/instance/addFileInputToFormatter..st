rendering
addFileInputToFormatter: formatter
	"is it a submit button?"
	| inputMorph size fileInput |
	inputMorph := PluggableTextMorph on: StringHolder new text: #contents accept: #acceptContents:.
	size := (self attributes at: 'size' ifAbsent: ['12']) asNumber.
	inputMorph extent: (size*10@20).
	fileInput := FileInput name: self name textMorph: inputMorph.
	formatter addMorph: inputMorph;
		addMorph: ((PluggableButtonMorph on: fileInput getState: nil action: #browse)
				label: 'Browse').
	self associatedForm addInput: fileInput