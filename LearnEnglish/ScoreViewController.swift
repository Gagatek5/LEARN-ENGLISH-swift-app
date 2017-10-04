//
//  ScoreViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 28/10/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

   
    @IBOutlet weak var ReapetButton: UIButton!
    @IBOutlet weak var Score: UILabel!
    var scoreLabel = String()
    var words = [String]()
    var answer = [String]()
    var answerTF = [String]()
    var reapetWrongAnswer = [String]()
    var currentWrongAnswer = " "
    var carrentTask = 0
    var value = [String]()
    var key = [String]()
    var valueFullList = [String]()
    var keyFullList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateAnswer(answerTable: answerTF)
        Score.text = scoreLabel
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return answer.count
    }
     @IBAction func Reapet(_ sender: Any) {
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       var countRemover = 0
        let cell = UITableViewCell(style: .default, reuseIdentifier: "userCell")
        cell.textLabel?.text = ("\(words[indexPath.row])   Your Answer:   \(answer[indexPath.row])" )
        if answerTF[indexPath.row] == "t" {
            
            cell.backgroundColor = UIColor.green
            var remove = indexPath.row - countRemover
            value.remove(at: remove)
            key.remove(at: remove)
            countRemover += countRemover
        }
        else
        {
           cell.backgroundColor = UIColor.red
            reapetWrongAnswer.append(words[indexPath.row])
           print(reapetWrongAnswer)
        }
        return (cell)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        currentWrongAnswer = (selectedCell.textLabel?.text)!

        print(currentWrongAnswer)
        
    }

    func calculateAnswer(answerTable:[String]){
        
        let a = answerTable.count - 1
        for i in 0...a{
            if(answerTable[i] == "f")
            {
                ReapetButton.isEnabled = true
            }

        }
        
    }
    @IBAction func ReapetBadAnswer(_ sender: Any) {
        if(carrentTask == 0 || carrentTask == 1 ){
        self.performSegue(withIdentifier:"Choose", sender: self)
        } else if (carrentTask == 2 || carrentTask == 3 ){
            self.performSegue(withIdentifier:"Write", sender: self)
        }
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Choose") {
            let learnView :ViewController = segue.destination as! ViewController
            learnView.selectTable = carrentTask
            learnView.keyFullList = keyFullList
            learnView.valueFullList = valueFullList
            if(carrentTask == 0 || carrentTask == 3)
            {
                
                learnView.key = reapetWrongAnswer
                learnView.value = value
            }else
            {
                learnView.key = key
                learnView.value = reapetWrongAnswer
                
            }
            
            
        }
        else if segue.identifier == "Write" {
            
            let writeView: WriteTestViewController = segue.destination as! WriteTestViewController
            writeView.currentTask = carrentTask
            writeView.keyFullList = keyFullList
            writeView.valueFullList = valueFullList
            if(carrentTask == 0 || carrentTask == 3)
            {
                
                writeView.key = reapetWrongAnswer
                writeView.value = value
            }else
            {
                writeView.key = key
                writeView.value = reapetWrongAnswer
                
            }
        }
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


