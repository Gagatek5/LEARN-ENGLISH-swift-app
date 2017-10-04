//
//  SettingsViewControler.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 06/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class SettingsViewControler: UIViewController {
    @IBOutlet weak var settingsTitle: UINavigationItem!
    @IBOutlet weak var backButtonTitle: UIBarButtonItem!
    @IBOutlet weak var addUserButton: UIButton!
    @IBOutlet weak var selectUserButton: UIButton!
    @IBOutlet weak var selectLanguageButton: UIButton!

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
        //UserDefaults.standard.translate("add user");
        
   
        
        addUserButton.setTitle(Language.s.translate(word: "Add user", scope: nil), for: .normal)
        selectUserButton.setTitle(Language.s.translate(word:"Select user", scope: nil), for: .normal)
        selectLanguageButton.setTitle(Language.s.translate(word:"Select language", scope: nil), for: .normal)
        settingsTitle.title = Language.s.translate(word:"Settings", scope: nil)
        backButtonTitle.title = Language.s.translate(word:"back", scope: nil)
        
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
