//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class DestiniViewController: UIViewController {

    let story1 = Story(storyText: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".")
    let answer1a = Answer(answer: "I\'ll hop in. Thanks for the help!")
    let answer1b = Answer(answer: "Better ask him if he\'s a murderer first.")
    
    let story2 = Story(storyText: "He nods slowly, unphased by the question.")
    let answer2a = Answer(answer: "At least he\'s honest. I\'ll climb in.")
    let answer2b = Answer(answer: "Wait, I know how to change a tire.")
    
    let story3 = Story(storyText: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.")
    let answer3a = Answer(answer: "I love Elton John! Hand him the cassette tape.")
    let answer3b = Answer(answer: "It\'s him or me! You take the knife and stab him.")
    
    let story4 = Story(storyText: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?")
    let story5 = Story(storyText: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.")
    let story6 = Story(storyText: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"")
    
    var storyIndex: Story! = nil
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
    
        storyIndex = story1
        setStory()
        uiUpdate()
    }

    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard storyIndex.answerA != nil else {
            storyIndex = story1
            topButton.isHidden = false
            uiUpdate()
            return
        }
        if sender.tag == 1 {
            storyIndex = storyIndex.answerA.nextStory
            
            
        } else {
            
            storyIndex = storyIndex.answerB.nextStory
            
            
        }
        uiUpdate()
    }
    //MARK: Update UI
    func uiUpdate() {
        storyTextView.text = storyIndex.story
        
        guard storyIndex.answerA == nil else {
            topButton.setTitle(storyIndex.answerA.answerText, for: .normal)
            bottomButton.setTitle(storyIndex.answerB.answerText, for: .normal)
            return
        }
        
        topButton.isHidden = true
        bottomButton.setTitle("Start Over", for: .normal)
    }
    
    //MARK: set the story
    func setStory() {
        answer1a.nextStory = story3
        answer1b.nextStory = story2
        answer2a.nextStory = story3
        answer2b.nextStory = story4
        answer3a.nextStory = story6
        answer3b.nextStory = story5
        
        story1.answerA = answer1a
        story1.answerB = answer1b
        story2.answerA = answer2a
        story2.answerB = answer2b
        story3.answerA = answer3a
        story3.answerB = answer3b
        
    }
}

