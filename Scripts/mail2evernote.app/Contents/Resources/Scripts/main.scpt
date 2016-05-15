JsOsaDAS1.001.00bplist00ÑVscript_9‘/**
 * Copyright 2016 M.G.B. Teutelink
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

ObjC.import("Cocoa");
ObjC.import('Foundation');

var PATH = ObjC.unwrap($.NSHomeDirectory()) + "/Library/Preferences/nl.intyme.mail2evernote.plist";
var properties = new Properties(PATH);

var App = Application.currentApplication();
App.includeStandardAdditions = true;

var Mail = Application('Mail');
var Evernote = Application('Evernote');
var System = Application('System Events');

library = Library("mail2evernote");

start();
function start() {
	var styleMask = $.NSTitledWindowMask | $.NSClosableWindowMask;
	var window = $.NSWindow.alloc.initWithContentRectStyleMaskBackingDefer($.NSMakeRect(0, 0, 474, 246), styleMask, $.NSBackingStoreBuffered, false);

	var systemFont = $.NSFont.systemFontOfSize($.NSFont.systemFontSizeForControlSize($.NSMiniControlSize));

	// DELEGATE
	ObjC.registerSubclass({
		name: "AppDelegate",
		methods: {
			"exportButtonClickHandler": {
				types: ["void", ["id"]],
				implementation: function (sender) {
					if (rememberButton.state == $.NSOnState) {
						App.displayAlert(ObjC.unwrap(reminderDatePicker.dateValue));
						properties.setValue("notebook", ObjC.unwrap(notebooksPopUpButton.titleOfSelectedItem));
						properties.setValue("addTags", ObjC.unwrap(tagsComboBox.stringValue));
						properties.setValue("addReminder", reminderButton.state);
						properties.setValue("addReminderDate", reminderDatePicker.dateValue);
						properties.setValue("addHeaders", addHeadersButton.state);
						properties.setValue("addRelatedMessages", addRelatedMessagesButton.state);
						properties.setValue("addOriginalMessages", addOriginalMessagesButton.state);
						properties.setValue("overwritePreviouslyExportedMailMessages", overwriteButton.state);
	
						properties.setValue("mailActionOnSuccess", ObjC.unwrap(actionPopUpButton.titleOfSelectedItem));
						properties.setValue("mailActionSettingOnSuccess", ObjC.unwrap(actionSettingPopUpButton.titleOfSelectedItem));

						properties.save();
					}
					library.mail2evernote();
					
					$.NSApp.terminate(this)
				}
			},
			"cancelButtonClickHandler": {
				types: ["void", ["id"]],
				implementation: function (sender) {
					$.NSApp.terminate(this)
				}
			},
			"mailActionPopUpButtonSelectionChanged": {
				types: ["void", ["id"]],
				implementation: function (sender) {
					actionSettingPopUpButton.enabled = (actionPopUpButton.titleOfSelectedItem.caseInsensitiveCompare("Set flag") ==0);
				}
			},
		}
	});
	var appDelegate = $.AppDelegate.alloc.init;

	// EVERNOTE
	var evernoteBox = $.NSBox.alloc.initWithFrame($.NSMakeRect(17, 79, 446, 165));
	evernoteBox.title = "Evernote";
	window.contentView.addSubview(evernoteBox);

	var evernoteBoxContentView = $.NSView.alloc.initWithFrame($.NSZeroRect);
	evernoteBox.contentView = evernoteBoxContentView;

	// EVERNOTE::NOTEBOOKS
	var notebooksLabel = $.NSTextField.alloc.initWithFrame($.NSMakeRect(5, 124, 67, 11));
	notebooksLabel.stringValue = "Notebooks:";
	notebooksLabel.controlSize = $.NSMiniControlSize;
	notebooksLabel.font = systemFont;
	notebooksLabel.drawsBackground = false;
	notebooksLabel.editable = false;
	notebooksLabel.bezeled = false;
	notebooksLabel.selectable = false;
	evernoteBoxContentView.addSubview(notebooksLabel);

	var notebooksPopUpButton = $.NSPopUpButton.alloc.initWithFramePullsDown($.NSMakeRect(64, 121, 253, 15), false);
	notebooksPopUpButton.controlSize = $.NSMiniControlSize;
	notebooksPopUpButton.font = systemFont;

	// EVERNOTE::NOTEBOOKS RETRIEVE ALL NOTEBOOKS
	var defaultNotebook = "";
	var notebookItems = [];
	var notebooks = Evernote.notebooks();
	for(var i = 0, size = notebooks.length; i < size ; i++) {
		notebookItems.push(notebooks[i].name());
		if (notebooks[i].default()) {
			defaultNotebook = notebooks[i].name();
		}
	}
	notebookItems.sort(function(a,b) {return (a.localeCompare(b));} ); 
	notebooksPopUpButton.addItemsWithTitles(notebookItems);
	
	var notebook = properties.getValueWithDefault("notebook", defaultNotebook);
	notebooksPopUpButton.selectItemAtIndex(notebookItems.indexOf(notebook));
	
	evernoteBoxContentView.addSubview(notebooksPopUpButton);

	// EVERNOTE::TAGS
	var tagsLabel = $.NSTextField.alloc.initWithFrame($.NSMakeRect(5, 106, 37, 11));
	tagsLabel.stringValue = "Tags:";
	tagsLabel.controlSize = $.NSMiniControlSize;
	tagsLabel.font = systemFont;
	tagsLabel.drawsBackground = false;
	tagsLabel.editable = false;
	tagsLabel.bezeled = false;
	tagsLabel.selectable = false;
	evernoteBoxContentView.addSubview(tagsLabel);

	var tagsComboBox = $.NSComboBox.alloc.initWithFrame($.NSMakeRect(64, 103, 253, 15));
	tagsComboBox.autoresizingMask = $.NSViewMaxYMargin;
	tagsComboBox.controlSize = $.NSMiniControlSize;
	tagsComboBox.font = systemFont;
	tagsComboBox.bezeled = false;

	// EVERNOTE::TAGS RETRIEVE ALL TAGS
	var tagItems = [];
	var tags = Evernote.tags();
	for(var i = 0, size = tags.length; i < size ; i++) {
		tagItems.push(tags[i].name());
	}
	tagItems.sort(function(a,b) {return (a.localeCompare(b));} ); 
	tagsComboBox.addItemsWithObjectValues(tagItems);
	
	var tag = properties.getValueWithDefault("addTags", "mail2evernote");
	tagsComboBox.selectItemAtIndex(tagItems.indexOf(tag));
	evernoteBoxContentView.addSubview(tagsComboBox);

	// EVERNOTE::OPTIONS
	var optionsLabel = $.NSTextField.alloc.initWithFrame($.NSMakeRect(5, 86, 42, 11));
	optionsLabel.stringValue = "Options:";
	optionsLabel.controlSize = $.NSMiniControlSize;
	optionsLabel.font = systemFont;
	optionsLabel.drawsBackground = false;
	optionsLabel.editable = false;
	optionsLabel.bezeled = false;
	optionsLabel.selectable = false;
	evernoteBoxContentView.addSubview(optionsLabel);

	var reminderButton = $.NSButton.alloc.initWithFrame($.NSMakeRect(61, 79, 82, 22));
	reminderButton.title = "Add reminder";
	reminderButton.controlSize = $.NSMiniControlSize;
	reminderButton.font = systemFont;
	reminderButton.bezelStyle = $.NSRoundedBezelStyle;
	reminderButton.buttonType = $.NSSwitchButton;
	reminderButton.state = properties.getValueWithDefault("addReminder", $.NSOnState);

	evernoteBoxContentView.addSubview(reminderButton);

	var reminderDatePicker = $.NSDatePicker.alloc.initWithFrame($.NSMakeRect(149, 79, 168, 17));
	reminderDatePicker.setDateValue(properties.getValueWithDefault("addReminderDate", new Date()));
	reminderDatePicker.controlSize = $.NSMiniControlSize;
	reminderDatePicker.font = systemFont;
	evernoteBoxContentView.addSubview(reminderDatePicker);

	var addHeadersButton = $.NSButton.alloc.initWithFrame($.NSMakeRect(61, 61, 256, 22));
	addHeadersButton.title = "Add email headers (Sender, Recipient, Subject, Date)";
	addHeadersButton.controlSize = $.NSMiniControlSize;
	addHeadersButton.font = systemFont;
	addHeadersButton.bezelStyle = $.NSRoundedBezelStyle;
	addHeadersButton.buttonType = $.NSSwitchButton;
	addHeadersButton.state = properties.getValueWithDefault("addHeaders", $.NSOnState);
	evernoteBoxContentView.addSubview(addHeadersButton);

	var addRelatedMessagesButton = $.NSButton.alloc.initWithFrame($.NSMakeRect(61, 43, 219, 22));
	addRelatedMessagesButton.title = "Add related mail messages (inReplyTo)";
	addRelatedMessagesButton.controlSize = $.NSMiniControlSize;
	addRelatedMessagesButton.font = systemFont;
	addRelatedMessagesButton.bezelStyle = $.NSRoundedBezelStyle;
	addRelatedMessagesButton.buttonType = $.NSSwitchButton;
	addRelatedMessagesButton.state = properties.getValueWithDefault("addRelatedMessages", $.NSOnState);
	evernoteBoxContentView.addSubview(addRelatedMessagesButton);

	var addOriginalMessagesButton = $.NSButton.alloc.initWithFrame($.NSMakeRect(61, 25, 219, 22));
	addOriginalMessagesButton.title = "Add original mail message as attachment";
	addOriginalMessagesButton.controlSize = $.NSMiniControlSize;
	addOriginalMessagesButton.font = systemFont;
	addOriginalMessagesButton.bezelStyle = $.NSRoundedBezelStyle;
	addOriginalMessagesButton.buttonType = $.NSSwitchButton;
	addOriginalMessagesButton.state = properties.getValueWithDefault("addOriginalMessages", $.NSOnState);
	evernoteBoxContentView.addSubview(addOriginalMessagesButton);

	var overwriteButton = $.NSButton.alloc.initWithFrame($.NSMakeRect(61, 7, 222, 22));
	overwriteButton.title = "Overwrite previously exported mail messages";
	overwriteButton.controlSize = $.NSMiniControlSize;
	overwriteButton.font = systemFont;
	overwriteButton.bezelStyle = $.NSRoundedBezelStyle;
	overwriteButton.buttonType = $.NSSwitchButton;
	overwriteButton.state = properties.getValueWithDefault("overwritePreviouslyExportedMailMessages", $.NSOnState);
	evernoteBoxContentView.addSubview(overwriteButton);

	// MAIL
	var mailBox = $.NSBox.alloc.initWithFrame($.NSMakeRect(17, 33, 446, 49));
	mailBox.title = "Mail";
	window.contentView.addSubview(mailBox);

	var mailBoxContentView = $.NSView.alloc.initWithFrame($.NSZeroRect);
	mailBox.contentView = mailBoxContentView;

	var performActionLabel = $.NSTextField.alloc.initWithFrame($.NSMakeRect(5, 8, 126, 11));
	performActionLabel.stringValue = "On succes perform action:";
	performActionLabel.drawsBackground = false;
	performActionLabel.editable = false;
	performActionLabel.bezeled = false;
	performActionLabel.selectable = false;
	performActionLabel.font = systemFont;
	mailBoxContentView.addSubview(performActionLabel);

	var actionPopUpButton = $.NSPopUpButton.alloc.initWithFramePullsDown($.NSMakeRect(133, 5, 166, 15), false);
	actionPopUpButton.controlSize = $.NSMiniControlSize;
	actionPopUpButton.font = systemFont;
	actionPopUpButton.target = appDelegate;
	actionPopUpButton.action = "mailActionPopUpButtonSelectionChanged";
	actionPopUpButton.enabled = true;

	var action = properties.getValueWithDefault("mailActionOnSuccess", "Do nothing");
	var actionItems = ["Do nothing", "Set flag", "Archive"];
	actionPopUpButton.addItemsWithTitles(actionItems);
	actionPopUpButton.selectItemAtIndex(actionItems.indexOf(action));
	
	mailBoxContentView.addSubview(actionPopUpButton);

	var actionSettingPopUpButton = $.NSPopUpButton.alloc.initWithFramePullsDown($.NSMakeRect(304, 5, 130, 15), false);
	actionSettingPopUpButton.controlSize = $.NSMiniControlSize;
	actionSettingPopUpButton.font = systemFont;
	actionSettingPopUpButton.enabled = (actionPopUpButton.titleOfSelectedItem.caseInsensitiveCompare("Set flag") ==0);

	actionSettingPopUpButton.addItemsWithTitles(["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Grey"]);
	var separator = $.NSMenuItem.separatorItem;
	actionSettingPopUpButton.menu.addItem(separator);
	actionSettingPopUpButton.addItemWithTitle("Clear flag");
	
	var actionSetting = properties.getValueWithDefault("mailActionSettingOnSuccess", "Red");
	var actionSettingItems = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Grey", "Clear flag"];
	var actionSettingItemsIndex = (actionSetting=='Clear flag') ? 8 : actionSettingItems.indexOf(actionSetting);
	actionSettingPopUpButton.selectItemAtIndex(actionSettingItemsIndex);

	mailBoxContentView.addSubview(actionSettingPopUpButton);

	// ACTIONS
	var rememberButton = $.NSButton.alloc.initWithFrame($.NSMakeRect(27, 12, 108, 22));
	rememberButton.title = "Remember settings";
	rememberButton.controlSize = $.NSMiniControlSize;
	rememberButton.font = systemFont;
	rememberButton.bezelStyle = $.NSRoundedBezelStyle;
	rememberButton.buttonType = $.NSSwitchButton;
	rememberButton.state = $.NSOffState;
	window.contentView.addSubview(rememberButton);

	var exportButton = $.NSButton.alloc.initWithFrame($.NSMakeRect(350, 13, 110, 16));
	var selectionCount = Mail.selection().length;
	exportButton.title = "Export (" + selectionCount + ((selectionCount > 1) ? " mails)" : " mail)");
	exportButton.controlSize = $.NSMiniControlSize;
	exportButton.font = systemFont;
	exportButton.bezelStyle = $.NSRoundedBezelStyle;
	exportButton.buttonType = $.NSMomentaryLightButton;
	exportButton.target = appDelegate;
	exportButton.action = "exportButtonClickHandler";
	window.contentView.addSubview(exportButton);

	var cancelButton = $.NSButton.alloc.initWithFrame($.NSMakeRect(275, 13, 71, 16));
	cancelButton.title = "Cancel";
	cancelButton.controlSize = $.NSMiniControlSize;
	cancelButton.font = systemFont;
	cancelButton.bezelStyle = $.NSRoundedBezelStyle;
	cancelButton.buttonType = $.NSMomentaryLightButton;
	cancelButton.target = appDelegate;
	cancelButton.action = "cancelButtonClickHandler";
	window.contentView.addSubview(cancelButton);

	window.releasedWhenClosed = true;
	window.center;
	window.makeKeyAndOrderFront(window);
}

/**
 * A class through which properties can be made persistent inside a .plist file. 
 * @param path the fully qualified path of the .plist properties file.
 */
function Properties(path) {
	this._path = path;
	this._properties = {};

	// Initialize from file
	var dictionary = ObjC.unwrap($.NSDictionary.alloc.initWithContentsOfFile(this._path));
	if (dictionary !== undefined) {
		this._properties = dictionary;
	}
	
	/**
	 * Retrieves the value for the key and sets and returns the defaultValue
	 * if specified key has no value assigned to it (yet).
	 * @param key the key
	 * @param defaultValue the value that is assigned to the key in no value 
	 *                     is assigned to the key (yet).
	 * @return the value assigned to the key.
	 */ 
	this.getValueWithDefault = function(key, defaultValue) {
		var retval = this._properties[key];
		if ((retval == undefined) || (retval == null) || (ObjC.unwrap(retval) == '')) {
			this.setValue(key, defaultValue);
			return defaultValue;
		}
		return ObjC.unwrap(retval);
	}

	/**
	 * Retrieves the value for the key.
	 * @param key the key
	 * @return the value assigned to the key; 
	 *         undefined if no value is assigned the specified key
	 */ 
	this.getValue = function(key) {
		return ObjC.unwrap(this._properties[key]);
	}
	
	/**
	 * Sets the value for the key.
	 * @param key the key
	 * @param value the value
	 * @return the value assigned to the key.
	 */ 
	this.setValue = function(key, value) {
		this._properties[key] = value;
		return value;
	}
		
	/**
	 * Saves the properties inside the .plist file specified by
	 * the fully qualified path
	 */ 
	this.save = function() {
		var dict = ObjC.wrap(this._properties);
		dict.writeToFileAtomically(this._path, true);
	}
}                              9§ jscr  úÞÞ­