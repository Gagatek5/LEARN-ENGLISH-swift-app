//
//  ListOfGroupViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 06/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class ListOfGroupViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var stepperValue: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var choseGroupLabel: UILabel!
    @IBOutlet weak var choseGroup: UIPickerView!
    @IBOutlet weak var startLearnButton: UIButton!
    @IBOutlet weak var learnPrepareTitle: UINavigationItem!
    @IBOutlet weak var backButtonTitle: UIBarButtonItem!
    var list = 10
    var pickerData = WordsDictionary.d.getCategories()
    var category = "all"
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func CounterOfWords(_ sender: UIStepper) {
        var label = String(sender.value)
        label =  label.substring(to: label.index(before: label.endIndex))
        label =  label.substring(to: label.index(before: label.endIndex))
        stepperValue.text = label
        
        let toInt = stepperValue.text
        list = Int(toInt!)!
    }

    @IBAction func startLearn(_ sender: AnyObject) {
        //list = 2
        performSegue(withIdentifier: "LearnOptionViewController", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "LearnOptionViewController") {
            let learnView :LearnOptionViewController = segue.destination as! LearnOptionViewController
            let listSelector = list
            learnView.selectTable = listSelector
            learnView.category = category
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = pickerData.sorted(){$0 < $1}
        language()
        // Do any additional setup after loading the view.
    }
    

    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category = pickerData[row]
        //print(category)
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor.blue])
        category = titleData
        print(category)
        return myTitle
    }
    func language()  {
        //UserDefaults.standard.translate("add user");
        myLabel.text = Language.s.translate(word: "Choose a number of words to learn:", scope: nil)
        choseGroupLabel.text = Language.s.translate(word: "Choose a category of words to learn:", scope: nil)
        startLearnButton.setTitle(Language.s.translate(word: "Start learn", scope: nil), for: .normal)
        learnPrepareTitle.title = Language.s.translate(word:"Learn settings", scope: nil)
        backButtonTitle.title = Language.s.translate(word:"back", scope: nil)
        
    }

    
    
    
   /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
