//
//  MoodsService.swift
//  mot-kreft
//
//  Created by Hans M. Inderberg on 10/31/14.
//  Copyright (c) 2014 Hans M. Inderberg. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MoodsService {
    
    typealias MoodsServiceResponse = (NSError?, [Mood]?) -> Void
    typealias CreateMoodResponse = (NSError?, Mood) -> Void
    
    func getMoods(callback: MoodsServiceResponse) {
        
        Alamofire.request(.GET, "http://api.mot-kreft.krafthack.it/moods/")
            .responseJSON { (request, response, json, error) -> Void in
                
                if (error != nil) {
                    return callback(error, nil)
                }
                
                let swiftyJSON = JSON(json!)["data"]
                
                var moods = [Mood]()
                
                for (key: String, subJson: JSON) in swiftyJSON {
                    
                    var mood = Mood(id:subJson["id"].int, ts: subJson["ts"].string, userId: subJson["user_id"].int, comment: subJson["comment"].string, location: subJson["location"].string, feel: subJson["feel"].int)
                    
                    moods.append(mood)
                    
                }
                
                callback(nil, moods)
        }
       
    }
    
    func postMood(mood: Mood, callback: CreateMoodResponse) {
        
        let parameters: [String: AnyObject] = [
            "location": mood.location!,
            "comment": mood.comment!,
            "feel": mood.feel!
        ]
        
        Alamofire.request(.POST, "http://api.mot-kreft.krafthack.it/moods/", parameters: parameters, encoding: .JSON)
            .responseJSON { (request, response, json, error) -> Void in
                
                if (error != nil) {
                    return callback(error, mood)
                }
                
                let swiftyJSON = JSON(json!)["data"]
                
                println(swiftyJSON)
                
                callback(nil, mood)
        }

        
    }
    
}