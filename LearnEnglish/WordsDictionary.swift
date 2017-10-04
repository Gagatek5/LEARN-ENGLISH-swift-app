//
//  File.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 15/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import Foundation



class WordsDictionary
{
    static let d = WordsDictionary()
    var words = [AnyObject]()
    init() {
        ImportWords(file: "JsonData")
        ImportWords(file: "JsonData copy")
        
        
                print(getWordsForCategory(category: "meat", primaryLanguage: "EN", secondaryLanguage: "PL"))
        
    }
    func ImportWords(file: String) {
        let Json = loadJson(forFilename: file)
        let w:NSArray = (Json?["words"] as? NSArray)!
        for i in 0 ..< (w.count)
        {
            words.append(w[i] as AnyObject)
        }

    }
   public func loadJson(forFilename fileName: String) -> NSDictionary? {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    
                    return dictionary
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
            print("Error!! Unable to load  \(fileName).json")
        }
    
        return nil
    }
    public func getCategories() -> Array<String>
    {
        var categories = [String]()
        for i in 0 ..< (words.count)
        {
            let c:NSArray = (words[i]["categories"] as? NSArray)!
            for k in 0 ..< (c.count)
            {
            categories.append(c[k] as! String)
            }
        }
        
        
        return Array(Set(categories))
    }
    public func getWordsForCategory(category:String, primaryLanguage:String, secondaryLanguage:String) -> NSDictionary
    {
        var listOfWords = [String:Array<String>]()
        for i in 0 ..< (words.count)
        {
            let c:NSArray = (words[i]["categories"] as? NSArray)!
            
            for k in 0 ..< (c.count)
            {
                if c[k] as! String == category
                {
                    
                    var pKey = words[i]["translations"] as? NSDictionary;//
                        pKey = pKey?[primaryLanguage]  as? NSDictionary;//
                    let pk = pKey?["word"] as? String;
                    //pKey = pKey?["word"] as? String
                    //var sKey = words[i]["translations"][secondaryLanguage]["word"]
                    var sKey = words[i]["translations"] as? NSDictionary;
                        sKey = sKey?[secondaryLanguage] as? NSDictionary;
                    let sk = sKey?["word"] as? String;
                    listOfWords[pk!] = [sk!]
                    break
                }
            }
        }
        return listOfWords as NSDictionary
    }

}
