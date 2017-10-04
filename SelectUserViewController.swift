//
//  SelectUserViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 03/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit
import CoreData
class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var selectUserTitle: UINavigationItem!
    @IBOutlet weak var backButtonTitle: UIBarButtonItem!
    
    var userNameCurrent: String = ""
    var userList: [String?] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return userList.count
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "userCell")
        cell.textLabel?.text = userList[indexPath.row]
        
        
        return (cell)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        language()
        getData()
        // Do any additional setup after loading the view.
    }
    func getData()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            
            if(results.count > 0)
            {
                for result in results as! [NSManagedObject]
                {
                    if let username = result.value(forKey: "user") as? String
                    {
                        userList.append(username)
                    }
                }
            }
        }
        catch
        {
            print(error)
            
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        userNameCurrent = (selectedCell.textLabel?.text)!
        UserDefaults.standard.setValue(userNameCurrent, forKey: "userName")
        UserDefaults.standard.synchronize()
       print(UserDefaults.standard.value(forKey: "userName") as Any)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func language()  {
        
        
        if UserDefaults.standard.value(forKey: "Language") as! String == "EN"
        {
   
            selectUserTitle.title = "Select user"
            backButtonTitle.title = "back"
        }
        else if UserDefaults.standard.value(forKey: "Language") as! String == "PL"
        {

            selectUserTitle.title = "Wybierz użytkownika"
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
