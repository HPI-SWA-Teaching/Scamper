menus
bookmark
	| menu sub url |
	menu := (MenuMorph entitled: ' Bookmark ' translated)
				defaultTarget: self.
	menu addStayUpItem.
	menu addLine.
	menu
		add: 'add to bookmark' translated
		target: self
		selector: #addToBookmark.
	menu add: 'Import...' translated target: self selector: #importBookmark. 
	menu addLine.
	self bookmarks
		keysAndValuesDo: 
			[:name :value | 
			url := value.
			(url isKindOf: Dictionary)
				ifTrue: 
					[sub := self addNewSubMenu: url.
					menu add: name subMenu: sub]
				ifFalse: [menu
						add: name
						selector: #jumpToUrlAsync:
						argument: url]].
	menu popUpInWorld: self currentWorld