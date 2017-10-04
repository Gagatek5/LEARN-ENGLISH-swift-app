//
//  File.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 15/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import Foundation



class Language
{
    var dict = [
            "main":[
                    "key":[
                        "EN":"Key",
                        "PL":"Klucz"
                    ],
                    "key2":[
                        "EN":"Key",
                        "PL":"Klucz"
                    ]
            ]
]


    
    public func translate( word:String , scope:String) -> String {
        let lang = UserDefaults.standard.value(forKey: "Language") as! String
        var translation = word
        if    dict["main"]![word]?[lang] != nil
        {
            translation = (dict["main"]![word]?[lang])!
            
        }
        //dict["main"]![word]?[lang]

    
        return translation
    }
}
