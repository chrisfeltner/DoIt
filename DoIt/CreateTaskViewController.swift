//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Christopher Feltner on 2/26/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var isImportantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onAddTaskPressed(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newTask = Task(context: context)
        newTask.name = taskNameTextField.text!
        newTask.isImportant = isImportantSwitch.isOn
        if taskNameTextField.text != ""{
            //pop back
            navigationController!.popViewController(animated: true)
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        
    }
    



}
