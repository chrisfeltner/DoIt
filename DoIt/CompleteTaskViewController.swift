//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Christopher Feltner on 2/27/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    

    var task : Task? = nil
    @IBOutlet weak var taskLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        taskLabel.text = task!.name

        // Do any additional setup after loading the view.
    }

    @IBAction func onCompleteButtonPressed(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }


}
