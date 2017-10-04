//
//  AddUserViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 03/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit
import CoreData
class AddUserViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addUserTitle: UINavigationItem!
    @IBOutlet weak var backButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        language()
        // Do any additional setup after loading the view.
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(_ sender: AnyObject) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: context)
        
        newUser.setValue(nameTextField.text, forKey: "user")
        newUser.setValue(passwordTextField.text, forKey: "password")
        if(emailTextField != nil){
            newUser.setValue(emailTextField.text, forKey: "email")
        }
        do{
            try context.save()
            
        }
        catch{
            print("error")
        }
       
    }
    func language()  {
        
        
        if UserDefaults.standard.value(forKey: "Language") as! String == "EN"
        {
            userNameLabel.text = "User name:"
            passwordLabel.text = "Password:"
            addButton.setTitle("Add", for: .normal)
            addUserTitle.title = "Add user"
            backButton.title = "back"
        }
        else if UserDefaults.standard.value(forKey: "Language") as! String == "PL"
        {
            userNameLabel.text = "Nazwa użytkownika:"
            passwordLabel.text = "Hasło"
            addButton.setTitle("Dodaj", for: .normal)
            addUserTitle.title = "Dodawanie użytkownika"
            backButton.title = "wróć"
            
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
