//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Christopher Feltner on 2/26/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    var previousVC = ViewController()
    @IBOutlet weak var isImportantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onAddTaskPressed(_ sender: Any) {
        let newTask = Task(name: taskNameTextField.text!, isImportant: isImportantSwitch.isOn)
        previousVC.tasks.append(newTask)
        previousVC.taskList.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    



}
