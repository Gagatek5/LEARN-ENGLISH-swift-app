//
//  LearnMenuViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 06/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class LearnMenuViewController: UIViewController {
    @IBOutlet weak var learnNewButton: UIButton!
    @IBOutlet weak var revisionButton: UIButton!
    @IBOutlet weak var myProgressButton: UIButton!
    @IBOutlet weak var learnMenuTitle: UINavigationItem!
    @IBOutlet weak var backButtonTitle: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        language()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func language()  {
        
        
        if UserDefaults.standard.value(forKey: "Language") as! String == "EN"
        {
            learnNewButton.setTitle("Learn new words", for: .normal)
            revisionButton.setTitle("Revision", for: .normal)
            myProgressButton.setTitle("My progress", for: .normal)
            learnMenuTitle.title = "Learn"
            backButtonTitle.title = "back"
        }
        else if UserDefaults.standard.value(forKey: "Language") as! String == "PL"
        {
            learnNewButton.setTitle("Nowe słówka", for: .normal)
            revisionButton.setTitle("Powtórzenie", for: .normal)
            myProgressButton.setTitle("Mój postęp", for: .normal)
            learnMenuTitle.title = "Nauka"
            backButtonTitle.title = "wróć"
            
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
