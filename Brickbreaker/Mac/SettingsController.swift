//
//  SettingsController.swift
//  Brickbreaker
//
//  Created by Alessandro Vinciguerra on 07/09/2017.
//	<alesvinciguerra@gmail.com>
//Copyright (C) 2017 Arc676/Alessandro Vinciguerra

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.
//See README and LICENSE for more details

import Cocoa

class SettingsController: NSViewController {
	
	//game settings
	//game modes and settings
	//timed regen
	@IBOutlet weak var enableTimeRegen: NSButton!
	@IBOutlet weak var time: NSTextField!
	//clearings regen
	@IBOutlet weak var enableClearingsRegen: NSButton!
	@IBOutlet weak var clearings: NSTextField!
	//random color change
	@IBOutlet weak var enableRandomColorChange: NSButton!
	@IBOutlet weak var colorChangeTime: NSTextField!
	//endlessness
	@IBOutlet weak var timeLimit: NSTextField!
	var endlessModeEnabled: Bool = false
	//tile colors
	@IBOutlet weak var tileColor1: NSColorWell!
	@IBOutlet weak var tileColor2: NSColorWell!
	@IBOutlet weak var tileColor3: NSColorWell!
	@IBOutlet weak var tileColor4: NSColorWell!
	//tile shape
	@IBOutlet weak var tileShapeSelection: NSPopUpButton!
	//arcade
	@IBOutlet weak var enableArcadeMode: NSButton!
	//background options
	@IBOutlet weak var backgroundStyle: NSMatrix!
	@IBOutlet weak var colorBGMode: NSButtonCell!
	@IBOutlet weak var imageBGMode: NSButtonCell!
	@IBOutlet weak var bgColor: NSColorWell!
	@IBOutlet weak var bgImage: NSImageView!
	//music settings
	@IBOutlet weak var pathToMusic: NSPathControl!
	@IBOutlet weak var loopMusic: NSButton!
	var music: NSSound?
	//interface settings
	@IBOutlet weak var quitOnClose: NSButton!
	//high scores
	@IBOutlet weak var pathToFile: NSPathControl!

	@IBAction func toggleEndless(_ sender: AnyObject) {
		endlessModeEnabled = (sender.state == NSOnState)
		timeLimit.isEnabled = !endlessModeEnabled
	}

	@IBAction func chooseMusic(_ sender: AnyObject) {
		let panel = NSOpenPanel()
		panel.allowedFileTypes = ["aiff","mp3","m4a","wav"]
		panel.allowsMultipleSelection = false
		if panel.runModal() == NSFileHandlingPanelOKButton {
			pathToMusic.url = panel.url!
			music = NSSound(contentsOf: panel.url!, byReference: true)
			music!.loops = (loopMusic.state == NSOnState)
		}
	}

	func playMusic() {
		if music?.play() ?? false {
			music?.resume()
		}
	}

	@IBAction func musicButton(_ sender: NSButton) {
		if sender.title == "Play" {
			playMusic()
		} else if sender.title == "Pause" {
			music?.pause()
		} else {
			music?.currentTime = 0
			playMusic()
		}
	}

}
