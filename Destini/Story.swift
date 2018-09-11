//
//  Story.swift
//  Destini
//
//  Created by atao1 on 9/8/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    
    let story : String
    var answerA: Answer! = nil
    var answerB: Answer! = nil

    
    init(storyText: String) {
        story = storyText
    }
    
}
