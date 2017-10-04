//
//  LearnOptionViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 21/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class LearnOptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var learnOptionTitle: UINavigationItem!
    @IBOutlet weak var LearnOption: UILabel!
    var listValue = Array<String>()
    var listKeys = [String]()
    var selectTable = 0
    var category = ""
    var arrayOfTask = ["Choose Polish Answer","Choose English Answer","Write Polish","Write English"]
    var carrentTask = 0
    let pickerData = WordsDictionary.d.getWordsForCategory(category: "all", primaryLanguage: "EN", secondaryLanguage: "PL")
    var valueFullList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomWords()
        getFeullList()
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startLearningButtonPush(_ sender: UIButton) {
        performSegue(withIdentifier: "start", sender: self)

    }
    
    func getFeullList()
    {
        let pickerData = WordsDictionary.d.getWordsForCategory(category: "all", primaryLanguage: "EN", secondaryLanguage: "PL")
        var value = pickerData.allValues as! Array<[String]>
        print(value)
        for i in 0...(value.count) - 1
        {
            valueFullList.append(value[Int(i)][0])
  
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let keyFullList = pickerData.allKeys as! [String]

        if (segue.identifier == "Choose English Answer") {
            let learnView :ViewController = segue.destination as! ViewController
            //print(listValue.count,  "Lol", [listValue])
            
            learnView.selectTable = carrentTask
            learnView.key = listKeys
            learnView.value = listValue
            learnView.keyFullList = keyFullList
            learnView.valueFullList = valueFullList
        }
        else if (segue.identifier == "Choose Polish Answer")
        {
            let learnView :ViewController = segue.destination as! ViewController
            //print(listValue.count,  "Lol", [listValue])y
            
            learnView.selectTable = carrentTask
            learnView.key = listKeys
            learnView.value = listValue
            learnView.keyFullList = keyFullList
            learnView.valueFullList = valueFullList
        }
        else if segue.identifier == "Write Polish"
        {
            let writeView: WriteTestViewController = segue.destination as! WriteTestViewController
            writeView.currentTask = carrentTask
            writeView.key = listKeys
            writeView.value = listValue
            writeView.keyFullList = keyFullList
            writeView.valueFullList = valueFullList
        }
        else if segue.identifier == "Write English"
        {
            let writeView: WriteTestViewController = segue.destination as! WriteTestViewController
            writeView.currentTask = carrentTask
            writeView.key = listKeys
            writeView.value = listValue
            writeView.keyFullList = keyFullList
            writeView.valueFullList = valueFullList
        }

    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return arrayOfTask.count
    }
    
    
   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TypeOf Learning")
        cell.textLabel?.text = arrayOfTask[indexPath.row]
        
        
        
        return (cell)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        //carrentTask =
        carrentTask = indexPath.row
        self.performSegue(withIdentifier: (selectedCell.textLabel?.text)!, sender: self)
        
    }
    func randomWords()
    {
        let pickerData = WordsDictionary.d.getWordsForCategory(category: category, primaryLanguage: "EN", secondaryLanguage: "PL")
        var key = pickerData.allKeys as! [String]
        var value = pickerData.allValues as! Array<[String]>
        print(value)
        var randomvalue:UInt32
        for i in 0...selectTable - 1
        {
            randomvalue = arc4random_uniform(UInt32(value.count))+1
            //print(value[Int(randomvalue)][0])
            print(i)
            
            listKeys.append(key[Int(randomvalue)])
           // key.remove(at: Int(randomvalue))
            listValue.append(value[Int(randomvalue)][0])
            value.remove(at: [Int(randomvalue)][0] )
            key.remove(at: Int(randomvalue))
            
            print(listKeys)
            
        }
        
      // checkKeysList()
    }
   /* func checkKeysList()-> ArraySlice<String>
    {
           }

    /**/
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
