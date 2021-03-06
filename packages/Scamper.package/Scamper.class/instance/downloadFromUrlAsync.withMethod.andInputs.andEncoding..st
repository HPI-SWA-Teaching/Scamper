changing page
downloadFromUrlAsync: aUrl withMethod: method andInputs: inputs andEncoding: encoding
	"Submit the given form with the provided inputs, url, method, and encoding"

	| promise downloadWork client resp urlWithArgs|
	promise := Promise new.
	
	downloadWork := [	| newSource |
		newSource := method asLowercase = 'get'
			ifTrue: [
					
					client := WebClient new.
					client userAgent: Scamper userAgent.
					urlWithArgs := self buildUrlStringFrom: aUrl WithFormInput: inputs.
					resp := client httpGet: urlWithArgs asString.
					resp content; close ]
			ifFalse:
				[ encoding = MIMEDocument contentTypeMultipart
					ifTrue: [ aUrl postMultipartFormArgs: inputs ]
					ifFalse: [ aUrl postFormArgs: inputs ] ].

		downloadingProcess := nil.
		promise resolveWith: newSource ].
	
	downloadingProcess := downloadWork forkAt: Processor userBackgroundPriority.
	
	^ promise
		