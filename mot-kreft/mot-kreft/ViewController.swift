//
//  ViewController.swift
//  mot-kreft
//
//  Created by Hans M. Inderberg on 10/31/14.
//  Copyright (c) 2014 Hans M. Inderberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var service:MoodsService?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = MoodsService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sadButtonTouch(sender: AnyObject) {
        
        let mood = Mood(id: 0, ts: "", userId: 0, comment: "Sadest", location: "In the house", feel: 25)
        service?.postMood(mood, callback: { (error, mood) -> Void in
        })
        
    }

    @IBAction func ambivalentButtonTouch(sender: AnyObject) {
        let mood = Mood(id: 0, ts: "", userId: 0, comment: "I dont fucking have a clue man! Dope!", location: "In the house", feel: 50)
        service?.postMood(mood, callback: { (error, mood) -> Void in
        })
    }
   
    @IBAction func smileyButtonTouch(sender: AnyObject) {
        let mood = Mood(id: 0, ts: "", userId: 0, comment: "Happiest", location: "In the house", feel: 100)
        service?.postMood(mood, callback: { (error, mood) -> Void in
        })
    }
}

