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
    static let s = Language()
    var dict = [
        "main":[
            "Polish":[
                "EN":"Polish",
                "PL":"Polski"
            ],
            "English":[
                "EN":"English",
                "PL":"Angielski"
            ],
            "Choose Language":[
                "PL":"Wybierz swój język"
            ],
            "back": [
                "PL":"wróć"
            ],
            "Menu":[
                "PL":"Menu"
            ],
            "Learn":[
                "PL":"Nauka"
            ],
            "Settings":[
                "PL":"Ustawienia"
            ],
            "Hi":[
                "PL":"Cześć"
            ],
            "Add user":[
                "PL":"Dodaj urzytkownika"
            ],
            "Select user":[
                "PL":"Wybierz urzytkownika"
            ],
              "Select language":[
                "PL":"Wybierz język"
            ],
            "Choose a number of words to learn:":[
                "PL":"Wybierz liczbe słówek do nauki:"
            ],
            "Choose a category of words to learn:":[
                "PL":"Wybierz kategorie słówek:"
            ],
            "Start learn":[
                "PL":"Rozpocznij nauke"
            ],
            "Learn settings":[
                "PL":"Opcje nauki"
            ]

            
        ],
        "main2":[
            "Polish":[
                "EN":"1",
                "PL":"2"
            ],
            "English":[
                "EN":"3",
                "PL":"4"
            ]
            
        ]

    ]
    
    
    
    public func translate( word:String , scope:String?) -> String {
        
        let lang = UserDefaults.standard.value(forKey: "Language") as! String
        var translation = word
        if    dict["main"]![word]?[lang] != nil
        {
            translation = (dict["main"]![word]?[lang])!
            
        }
        if scope != nil
        {
            if    dict[(scope)!]?[word]?[lang] != nil
            {
                translation = (dict[scope!]![word]?[lang])!
                
            }
            //dict["main"]![word]?[lang]
        }
        
        return translation
    }
}
