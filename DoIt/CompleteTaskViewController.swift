//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Christopher Feltner on 2/27/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var previousVC = ViewController()
    var task = Task(name: "", isImportant: false)
    @IBOutlet weak var taskLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        taskLabel.text = task.name

        // Do any additional setup after loading the view.
    }

    @IBAction func onCompleteButtonPressed(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedTaskIndex)
        previousVC.taskList.reloadData()
        navigationController!.popViewController(animated: true)
    }


}
