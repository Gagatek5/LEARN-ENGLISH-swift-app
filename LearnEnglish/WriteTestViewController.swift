//
//  WriteTestViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 22/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class WriteTestViewController: UIViewController {

    @IBOutlet weak var displayWordQuestion: UILabel!
    @IBOutlet weak var displayTask: UILabel!
    @IBOutlet weak var answerTextBox: UITextField!
    var currentTask = 0
    var key =  [String]()
    var value = Array<String>()
    var score = 0
    var currnetWord = 0
    var answer = [String]()
    var answerTF = [String]()
    var valueFullList = [String]()
    var keyFullList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool)
    {
        checkAnswer()
        
    }
    @IBAction func PushAnswer(_ sender: AnyObject) {
        if currentTask == 2
        {
            if answerTextBox.text == value[currnetWord]
                {
                    print("ok")
                    score += 1
                    answer.append(value[currnetWord] + " " + key[currnetWord])
                    answerTF.append("t")
                }
            else
                {
                    print("Wrong")
                    answer.append(value[currnetWord] +  " Your Answer: " + answerTextBox.text!)
                    answerTF.append("f")
                }
            if currnetWord == value.count - 1
            {
            
                performSegue(withIdentifier: "score", sender: self)
            }
            else
            {
                currnetWord += 1
                displayWordQuestion.text = key[currnetWord]
                answerTextBox.text = nil
                checkAnswer()
            }
        }else if currentTask == 3
        {
            if answerTextBox.text == key[currnetWord]
            {
                print("ok")
                score += 1
                answer.append(key[currnetWord] + " " + value[currnetWord])
                answerTF.append("t")
            }
            else
            {
                print("Wrong")
                answer.append(key[currnetWord] +  " Your Answer: " + answerTextBox.text!)
                answerTF.append("f")
            }
            if currnetWord == value.count - 1
            {
                
                performSegue(withIdentifier: "score", sender: self)
            }
            else
            {
                currnetWord += 1
                displayWordQuestion.text = key[currnetWord]
                checkAnswer()
            }

        }
      
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //currentList = whichDictionary()
        let ScoreView :ScoreViewController = segue.destination as! ScoreViewController
        let scoreText = "\(score)"
        let maxScore = "\(value.count)"
        ScoreView.scoreLabel = (scoreText + "/" + maxScore)
        ScoreView.answer = answer
        ScoreView.answerTF = answerTF
    }

    func checkAnswer()  {
        print(value,key,currentTask)
        if currentTask == 2
        {
            displayWordQuestion.text = key[currnetWord]
            //displayTask.text = key[currnetWord]
            
                           
        }
        else if currentTask == 3
        {
            displayWordQuestion.text = value[currnetWord]
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
