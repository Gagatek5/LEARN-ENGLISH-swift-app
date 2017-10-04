//
//  LanguageViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 03/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var languageTitle: UINavigationItem!
    
    @IBOutlet weak var backButtonTitle: UIBarButtonItem!

    @IBOutlet weak var plButton: UIButton!
    @IBOutlet weak var enButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        language()
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    @IBAction func PL(_ sender: UIButton) {
        
        UserDefaults.standard.setValue("PL", forKey: "Language")
          language()
    }

    @IBAction func EN(_ sender: UIButton) {
        
        UserDefaults.standard.setValue("EN", forKey: "Language")
          language()
    }
    func language()  {
       
       
        plButton.setTitle(Language.s.translate(word: "Polish", scope: nil), for: .normal)
        enButton.setTitle(Language.s.translate(word: "English", scope: nil), for: .normal)
        languageTitle.title = Language.s.translate(word: "Choose Language", scope: nil)
        backButtonTitle.title = Language.s.translate(word: "back", scope: nil)
        
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
