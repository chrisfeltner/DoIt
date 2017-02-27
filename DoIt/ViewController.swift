//
//  ViewController.swift
//  DoIt
//
//  Created by Christopher Feltner on 2/26/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskList: UITableView!
    var tasks : [Task] = []
    var selectedTaskIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeTasks()
        taskList.dataSource = self
        taskList.delegate = self
    }
    
    @IBAction func onAddButtonPress(_ sender: Any) {
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTaskSegue"
        {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        else if segue.identifier == "selectTaskSegue"
        {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.previousVC = self
            nextVC.task = sender as! Task
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if(tasks[indexPath.row].isImportant)
        {
            cell.textLabel?.text = "❗️\(tasks[indexPath.row].name)"
        }
        else{
            cell.textLabel?.text = tasks[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedTaskIndex = indexPath.row
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        
    }
    
    func makeTasks() -> [Task]
    {
        let task1 = Task(name: "Walk dog", isImportant: false)
        let task2 = Task(name: "Buy cheese", isImportant: true)
        let task3 = Task(name: "Finsih work", isImportant: false)
        return [task1, task2, task3]
    }
    
}

