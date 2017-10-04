//
//  ViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 27/10/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
     var arrayButton = [UIButton]()
    var trueAnswerLabel:String = " "
    var currentWord = 0
    var trueAnswer:UInt32 = 0
    var rndAns:UInt32 = 0
    var selectTable = 0
    var score = 0
    var currentList:Int = 0
   // var listD = WordsDictionary.d.getWordsForCategory(category: "animal", primaryLanguage: "EN", secondaryLanguage: "PL")
    //var list:NSDictionary = [String:Array<String>]() as NSDictionary
  //  word chicken
    var but:UIButton = UIButton()
    var value = [String]()
    var key = [String]()
    var valueFullList = [String]()
    var keyFullList = [String]()
    var wrongAnswer = [String]()
    var words = [String]()
    var answer = [String]()
    var answerTF = [String]()
    var button:UIButton = UIButton()
    @IBOutlet weak var Word: UILabel!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func pushAnswer(_ sender: UIButton)
    {
    
   
       if(sender.tag == Int(trueAnswer))
        {
            score += 1
            answer.append((sender.titleLabel?.text)! )
            words.append(Word.text!)
            answerTF.append("t")
        }
       
        else
        {
            print(sender.titleLabel?.text as Any)
            
            answer.append((sender.titleLabel?.text)!)
            words.append(Word.text!)
            answerTF.append("f")

        }
        
        
        for i in 1...4
        {
             but = arrayButton[i-1]
            //self.but.isEnabled = = false
        but.isEnabled = false
        
        //Timer.scheduledTimer(timeInterval: 30 , target: self, selector: #selector(ViewController.enable), userInfo: nil, repeats: false)
        }
        Timer.scheduledTimer(timeInterval: 0.5 , target: self, selector: #selector(ViewController.enable), userInfo: nil, repeats: false)
        if(currentWord != currentList)
        {
        newWord()
        }
        else
        {
            
            performSegue(withIdentifier: "show", sender: self)
        }
    }
    @objc func enable() {
        for i in 1...4
        {
            but = arrayButton[i-1]
            //self.but.isEnabled = = false
            
             self.but.isEnabled = true
            //Timer.scheduledTimer(timeInterval: 30 , target: self, selector: #selector(ViewController.enable), userInfo: nil, repeats: false)
        }

       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //currentList = whichDictionary()
        let ScoreView :ScoreViewController = segue.destination as! ScoreViewController
        let scoreText = "\(score)"
        let maxScore = "\(currentList)"
        ScoreView.words = words
        ScoreView.scoreLabel = (scoreText + "/" + maxScore)
        ScoreView.answer = answer
        ScoreView.answerTF = answerTF
        ScoreView.value = value
        ScoreView.key = key
        ScoreView.valueFullList = valueFullList
        ScoreView.keyFullList = keyFullList
        ScoreView.carrentTask = selectTable
       
    }
    

    override func viewDidAppear(_ animated: Bool)
    {
        newWord()
        
            }
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that cand be recreated.
    }
    func newWord ()
{
    
    if( selectTable == 0)
    {
    currentList = value.count
    Word.text = key[currentWord]
    trueAnswer = arc4random_uniform(3)+1
    
    
     //trueAnswerLabel = Word.text!
    var x = 0
    var rnd = randNumber()
   
    for i in 1...4
    {
        button = view.viewWithTag(i) as! UIButton
        arrayButton.append(button)
       
        if (i == Int(trueAnswer))
        {
            button.setTitle(value[currentWord], for: .normal)
           // print(button.titleLabel?.text)
        }
        else
        {
            let rndAnswer = rnd[x]
            let intRandAns:Int = Int(rndAnswer)
            button.setTitle(valueFullList[intRandAns], for: .normal)
            wrongAnswer = [valueFullList[intRandAns]]
            x += 1
        }
        
        //button.setTitle(value[currentWord][x], for: .normal)
    }
    print(arrayButton)
    currentWord += 1
    }
    else
    {
        currentList = key.count //value.count
        Word.text = value[currentWord] //key[currentWord]
        trueAnswer = arc4random_uniform(3)+1
        
        
        //trueAnswerLabel = Word.text!
        var x = 0
        var rnd = randNumber()
        
        for i in 1...4
        {
            button = view.viewWithTag(i) as! UIButton
            arrayButton.append(button)
            
            if (i == Int(trueAnswer))
            {
                button.setTitle(key[currentWord], for: .normal)
                // print(button.titleLabel?.text)
            }
            else
            {
                let rndAnswer = rnd[keyFullList.count]
                let intRandAns:Int = Int(rndAnswer)
                button.setTitle(keyFullList[intRandAns], for: .normal)
                wrongAnswer = [keyFullList[intRandAns]]
                x += 1
            }
            
            //button.setTitle(value[currentWord][x], for: .normal)
        }
        print(arrayButton)
        currentWord += 1
    }
    }
    func randNumber()-> Array <Int>
        {
            var randAns:Array<Int> = []
           
            for i in 0...2{
                if i <= 2
                {
                    
                    rndAns = arc4random_uniform(UInt32(currentList))
                    randAns.append(Int(rndAns))
                    print(randAns, i , currentList)
                }
            }
            if randAns[0] != randAns[1] && randAns[0] != randAns[2] && randAns[1] != randAns[2] && randAns[0] != currentWord && randAns[1] != currentWord && randAns[2] != currentWord
            {
                
                return randAns
            }
            else
            {
               
                return randNumber()
            }
    

    }
}
