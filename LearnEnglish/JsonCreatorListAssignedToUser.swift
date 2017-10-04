//
//  JsonCreatorListAssignedToUser.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 14/03/2017.
//  Copyright © 2017 Tomasz Twardowski. All rights reserved.
//

import Foundation
import CoreData


class JsonCreatorListAssignedToUser
{
    var array = ["Buck", "Ant", "Bird", "Bull", "Turkey", "Cat", "Bear", "Owl", "Chicken"]
    var user = UserDefaults.standard.value(forKey: "userName")
       func CreateList()
    {
      /*  let validDictionary = [
            "numericalValue": 1,
            "stringValue": "JSON",
            "arrayValue": [0, 1, 2, 3, 4, 5]
        ] as [String : Any]*/
        
        let rawData: NSData!
        
        
        if JSONSerialization.isValidJSONObject(array) { // True
            do {
                rawData = try JSONSerialization.data(withJSONObject: array, options: .prettyPrinted) as NSData!
                try rawData.write(toFile: "newdata.json", options: .atomic)
                
                let jsonData = NSData(contentsOfFile: "newdata.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                // -> ["stringValue": "JSON", "arrayValue": [0, 1, 2, 3, 4, 5], "numericalValue": 1]
                
            } catch {
                // Handle Error
            }
        }
            
            
    }
}
