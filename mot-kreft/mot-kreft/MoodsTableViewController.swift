//
//  MoodsTableViewController.swift
//  mot-kreft
//
//  Created by Hans M. Inderberg on 10/31/14.
//  Copyright (c) 2014 Hans M. Inderberg. All rights reserved.
//

import UIKit

class MoodsTableViewController: UITableViewController {
    
    var moods:[Mood]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = MoodsService()
        service.getMoods { (error, moods) -> Void in
            self.moods = moods
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.moods?.count {
            return count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("moodCell") as MoodTableViewCell
        
        let mood = self.moods?[indexPath.row]
    
        cell.comment.text = mood?.comment
        cell.location.text = mood?.location
        
        if var feel = mood?.feel {
            switch feel {
            case 0...25:
                cell.moodImageView.image = UIImage(named: "sad_blue")
            case 26...50:
                cell.moodImageView.image = UIImage(named: "ambivalent_purple")
            default:
                cell.moodImageView.image = UIImage(named: "smiley_green")
            }
        }
        
        return cell
        
    }

}
